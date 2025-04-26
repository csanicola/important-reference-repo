# Build a Time Calculator
# from the scientific computing with python course on freecodecamp


def add_time(start, duration, starting_day=None):
    # List of days for day calculation (index 0-6)
    days_of_week = ["Monday", "Tuesday", "Wednesday",
                    "Thursday", "Friday", "Saturday", "Sunday"]

    # Extract start time components
    start_time, meridiem = start.split()
    start_hour, start_minute = map(int, start_time.split(':'))

    # Convert to 24-hour format for calculations
    if meridiem == "PM" and start_hour != 12:
        start_hour += 12
    if meridiem == "AM" and start_hour == 12:
        start_hour = 0

    # Parse duration inputs
    duration_hour, duration_minute = map(int, duration.split(':'))

    # Calculate total minutes and hours
    total_minutes = start_minute + duration_minute
    total_hours = start_hour + duration_hour + (total_minutes // 60)

    # Final time components
    end_minute = total_minutes % 60
    end_hour = total_hours % 24
    days_passed = total_hours // 24

    # Convert back to 12-hour format
    if end_hour == 0:
        display_hour = 12
        display_meridiem = "AM"
    elif end_hour < 12:
        display_hour = end_hour
        display_meridiem = "AM"
    else:
        display_hour = end_hour - 12 if end_hour > 12 else end_hour
        display_meridiem = "PM"

    # Format time string
    new_time = f"{display_hour}:{end_minute:02d} {display_meridiem}"

    # Add day of week if provided
    if starting_day:
        day_index = days_of_week.index(starting_day.capitalize())
        new_day = days_of_week[(day_index + days_passed) % 7]
        new_time += f", {new_day}"

    # Add day difference notation
    if days_passed == 1:
        new_time += " (next day)"
    elif days_passed > 1:
        new_time += f" ({days_passed} days later)"

    return new_time


print(add_time("3:00 PM", "3:10"))
print(add_time("11:30 AM", "2:32", "Monday"))
print(add_time("11:43 AM", "00:20"))
print(add_time("10:10 PM", "3:10"))
print(add_time("11:43 PM", "24:20", "tuesday"))
print(add_time("6:30 PM", "205:12"))
