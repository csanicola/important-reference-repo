##############################################################
#### == Python Script for CSV Data Dictionary Creation == ####
##############################################################

# Here's a Python script that creates a comprehensive data dictionary for any CSV file:

import pandas as pd
import numpy as np
from collections import Counter
import argparse
import sys


def analyze_column(series):
    """Analyze a single column and return its characteristics"""

    # Basic info
    total_n = len(series)
    non_null_count = series.count()
    missing_count = total_n - non_null_count
    missing_percentage = (missing_count / total_n) * 100 if total_n > 0 else 0

    # Determine data type
    dtype = str(series.dtype)

    # Remove missing values for analysis
    clean_series = series.dropna()

    result = {
        'total_n': total_n,
        'non_null_count': non_null_count,
        'missing_count': missing_count,
        'missing_percentage': round(missing_percentage, 2),
        'dtype': dtype
    }

    # Check if column is numeric (continuous)
    if pd.api.types.is_numeric_dtype(clean_series):
        result['variable_type'] = 'continuous'
        result['mean'] = round(clean_series.mean(), 4) if len(clean_series) > 0 else None
        result['median'] = round(clean_series.median(), 4) if len(clean_series) > 0 else None
        result['std_dev'] = round(clean_series.std(), 4) if len(clean_series) > 0 else None
        result['min'] = clean_series.min() if len(clean_series) > 0 else None
        result['max'] = clean_series.max() if len(clean_series) > 0 else None
        result['categories'] = None
        result['category_counts'] = None

    # Check if column is categorical (including strings and objects with few unique values)
    else:
        # Convert to string and count unique values
        str_series = clean_series.astype(str)
        unique_count = len(str_series.unique())

        # Consider it categorical if unique values are less than 50 or it's object type
        if unique_count <= 50 or pd.api.types.is_string_dtype(clean_series):
            result['variable_type'] = 'categorical'
            result['mean'] = None
            result['median'] = None
            result['std_dev'] = None
            result['min'] = None
            result['max'] = None

            # Get category counts
            category_counts = Counter(str_series)
            # Sort by count descending
            sorted_categories = dict(sorted(category_counts.items(),
                                            key=lambda x: x[1], reverse=True))

            result['categories'] = list(sorted_categories.keys())
            result['category_counts'] = sorted_categories
            result['unique_categories'] = unique_count

        else:
            # Treat as continuous-like but non-numeric (e.g., IDs, dates)
            result['variable_type'] = 'other'
            result['mean'] = None
            result['median'] = None
            result['std_dev'] = None
            result['min'] = None
            result['max'] = None
            result['categories'] = None
            result['category_counts'] = None
            result['unique_values'] = unique_count

    return result


def create_data_dictionary(csv_file_path, output_file=None):
    """Create a data dictionary from a CSV file"""

    try:
        # Read the CSV file
        print(f"Reading CSV file: {csv_file_path}")
        df = pd.read_csv(csv_file_path)

        print(f"Dataset shape: {df.shape}")
        print(f"Columns: {list(df.columns)}")
        print("\nAnalyzing columns...")

        # Analyze each column
        data_dict = {}
        for col in df.columns:
            print(f"  Analyzing: {col}")
            data_dict[col] = analyze_column(df[col])

        # Create summary table
        summary_data = []
        for col_name, col_info in data_dict.items():
            row = {
                'column_name': col_name,
                'data_type': col_info['dtype'],
                'variable_type': col_info['variable_type'],
                'total_n': col_info['total_n'],
                'non_null_count': col_info['non_null_count'],
                'missing_count': col_info['missing_count'],
                'missing_percentage': col_info['missing_percentage']
            }

            if col_info['variable_type'] == 'continuous':
                row.update({
                    'mean': col_info['mean'],
                    'median': col_info['median'],
                    'std_dev': col_info['std_dev'],
                    'min': col_info['min'],
                    'max': col_info['max'],
                    'categories': 'N/A',
                    'category_counts': 'N/A',
                    'unique_categories': 'N/A'
                })
            elif col_info['variable_type'] == 'categorical':
                row.update({
                    'mean': 'N/A',
                    'median': 'N/A',
                    'std_dev': 'N/A',
                    'min': 'N/A',
                    'max': 'N/A',
                    'categories': ', '.join(col_info['categories'][:5]) +
                                  ('...' if len(col_info['categories']) > 5 else ''),
                    'category_counts': 'See detailed output',
                    'unique_categories': col_info['unique_categories']
                })
            else:
                row.update({
                    'mean': 'N/A',
                    'median': 'N/A',
                    'std_dev': 'N/A',
                    'min': 'N/A',
                    'max': 'N/A',
                    'categories': 'N/A',
                    'category_counts': 'N/A',
                    'unique_categories': col_info.get('unique_values', 'N/A')
                })

            summary_data.append(row)

        # Convert to DataFrame for nice display
        summary_df = pd.DataFrame(summary_data)

        # Display results
        print("\n" + "=" * 80)
        print("DATA DICTIONARY SUMMARY")
        print("=" * 80)

        # Display summary table
        pd.set_option('display.max_columns', None)
        pd.set_option('display.width', None)
        pd.set_option('display.max_colwidth', 30)

        print("\nSummary Table:")
        print(summary_df.to_string(index=False))

        # Display detailed categorical information
        print("\n" + "=" * 80)
        print("DETAILED CATEGORICAL VARIABLES")
        print("=" * 80)

        for col_name, col_info in data_dict.items():
            if col_info['variable_type'] == 'categorical':
                print(f"\nColumn: {col_name}")
                print(f"Unique categories: {col_info['unique_categories']}")
                print("Top categories:")
                for category, count in list(col_info['category_counts'].items())[:10]:
                    percentage = (count / col_info['non_null_count']) * 100
                    print(f"  '{category}': {count} ({percentage:.1f}%)")
                if len(col_info['category_counts']) > 10:
                    print(f"  ... and {len(col_info['category_counts']) - 10} more categories")

        # Save to file if requested
        if output_file:
            # Save summary to CSV
            summary_df.to_csv(output_file, index=False)

            # Save detailed categorical info to a text file
            detailed_file = output_file.replace('.csv', '_detailed.txt')
            with open(detailed_file, 'w') as f:
                f.write("DATA DICTIONARY - DETAILED REPORT\n")
                f.write("=" * 50 + "\n\n")

                for col_name, col_info in data_dict.items():
                    f.write(f"COLUMN: {col_name}\n")
                    f.write(f"Data Type: {col_info['dtype']}\n")
                    f.write(f"Variable Type: {col_info['variable_type']}\n")
                    f.write(f"Total N: {col_info['total_n']}\n")
                    f.write(f"Non-null Count: {col_info['non_null_count']}\n")
                    f.write(f"Missing Count: {col_info['missing_count']}\n")
                    f.write(f"Missing Percentage: {col_info['missing_percentage']}%\n")

                    if col_info['variable_type'] == 'continuous':
                        f.write(f"Mean: {col_info['mean']}\n")
                        f.write(f"Median: {col_info['median']}\n")
                        f.write(f"Standard Deviation: {col_info['std_dev']}\n")
                        f.write(f"Min: {col_info['min']}\n")
                        f.write(f"Max: {col_info['max']}\n")

                    elif col_info['variable_type'] == 'categorical':
                        f.write(f"Unique Categories: {col_info['unique_categories']}\n")
                        f.write("Category Counts:\n")
                        for category, count in col_info['category_counts'].items():
                            percentage = (count / col_info['non_null_count']) * 100
                            f.write(f"  '{category}': {count} ({percentage:.1f}%)\n")

                    f.write("\n" + "-" * 50 + "\n\n")

            print(f"\nSummary saved to: {output_file}")
            print(f"Detailed report saved to: {detailed_file}")

        return data_dict, summary_df

    except Exception as e:
        print(f"Error reading CSV file: {e}")
        return None, None


def main():
    parser = argparse.ArgumentParser(description='Create a data dictionary from any CSV file')
    parser.add_argument('csv_file', help='Path to the CSV file')
    parser.add_argument('-o', '--output', help='Output file path (optional)')

    args = parser.parse_args()

    # If no arguments provided, ask for input
    if len(sys.argv) == 1:
        csv_file = input("Enter the path to your CSV file: ")
        output_file = input("Enter output file path (press Enter to skip): ").strip()
        if output_file == '':
            output_file = None
    else:
        csv_file = args.csv_file
        output_file = args.output

    create_data_dictionary(csv_file, output_file)


if __name__ == "__main__":
    main()


####################
####== USAGE: ==####
####################

# Command line with arguments:
# python data_dictionary.py your_file.csv
# python data_dictionary.py your_file.csv -o output.csv
