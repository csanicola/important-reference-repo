# Build an Arithmetic Formatter
# from the scientific computing with python course on freecodecamp

def arithmetic_arranger(problems, display_answers=False):
    # Check if the number of problems exceeds 5
    if len(problems) > 5:
        return "Error: Too many problems."

    first_line = []
    second_line = []
    dashes_line = []
    answers_line = []

    for problem in problems:
        parts = problem.split()
        num1, operator, num2 = parts[0], parts[1], parts[2]

        # Check if the operator is valid
        if operator not in ('+', '-'):
            return "Error: Operator must be '+' or '-'."

        # Check if numbers are digits
        if not (num1.isdigit() and num2.isdigit()):
            return "Error: Numbers must only contain digits."

        # Check if numbers are within the four-digit limit
        if len(num1) > 4 or len(num2) > 4:
            return "Error: Numbers cannot be more than four digits."

        # Determine the width of the formatted problem
        # Space for operator and at least one space
        width = max(len(num1), len(num2)) + 2

        # Format each line accordingly
        first_line.append(num1.rjust(width))
        second_line.append(operator + " " + num2.rjust(width - 2))
        dashes_line.append("-" * width)

        # If answers need to be displayed, compute and format them
        if display_answers:
            # Safe here because input is validated
            result = str(eval(num1 + operator + num2))
            answers_line.append(result.rjust(width))

    # Join the formatted components with four spaces between each problem
    arranged_problems = "    ".join(
        first_line) + "\n" + "    ".join(second_line) + "\n" + "    ".join(dashes_line)

    if display_answers:
        arranged_problems += "\n" + "    ".join(answers_line)

    return arranged_problems
