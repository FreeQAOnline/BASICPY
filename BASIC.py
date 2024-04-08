variables = {}
instructions = {
    "INT": "This creates an integer",
    "STRING": "This creates a string",
    "PRINT": "This outputs stuff",
    "ADD":   "This adds two variables",
    "FLOAT": "This creates a float",
    "EXIT":  "This exits the interpreter",
}
def READ(inp):
    if inp.startswith("INT"):
        variableName  = inp[4::]
        if not variableName in variables:
             variables[variableName] = int(input("Enter the variable's value > "))
        else:
            print(f"{variableName} already exists!")
    elif inp.startswith("FLOAT"):
        variableName = inp[6::]
        if not variableName in variables:
            variables[variableName] = float(input("Enter the variable's value > "))
    elif inp.startswith("STRING"):
        variable = inp[7::]
        if not variable in variables:
            variables[variable] = str(input("Enter the value for the variable > "))
        else:
            print(f"The variable {variable} already exists!")
    elif inp.startswith("VIEW"):
        variable = inp[5::]
        if variable in variables:
            print(variables[variable])
    elif inp.startswith("PRINT"):
        MSG = inp[6::]
        print(MSG)
    elif inp.startswith("HELP"):
            ins = inp[5::]
            if ins in instructions:
                print(instructions[ins])
            else:
                if ins != "":
                    print(f"The instruction {ins} does not exist")
    elif inp.startswith("SUBTRACT"):
        variable1 = input("Enter the variable > ")
        variabl2 = input("Enter the other variable > ")
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variabl1] - variables[variable2]
    elif inp.startswith("DIVIDE"):
        variable1 = float(input("Enter a variable > "))
        variable2 = float(input("Enter another variable > "))
        if variable1 in variables and variable2 in variables and variable1 > 0.0 and variable2 > 0.0:
            variables[variable1] = variables[1] / variables[variable2]
        elif variable1 < 1 or variable2 < 1:
            print(f"You cannot divide by {variable1}")
        else:
            if variable1 and variable2 not in variables:
                print(f"{variable1} and {variable2} are not existing variables!")
    elif inp.startswith("MULTIPLY"):
        variable1 = float(input("Enter a variable > "))
        variable2 = float(input("Enter another variable > "))
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variable1] * variables[variable2]
        else:
            print(f"The variables {variable1} and {variable2} are not defined!")
    elif inp.startswith("ADD"):
        variable1 = input("Enter the variable > ")
        variable2 = input("Enter the other variable > ")
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variable1] + variables[variable2]
            print(f"The sum is {variables[variable1]}")
        else:
            print(f"The variables {variable1} and {variable2} do not exist!")
    elif inp.startswith("SETINT"):
        variable = inp[6::]
        if variable in variables:
            variables[variable] = input("Enter the new value > ")
        else:
            print(f"{variable} is not an existing variable!")
    elif inp.startswith("DEL"):
        variable = inp[4::]
        if variable in variables:
            del variables[variable]
            print(f"Deleted the variable {variable}")
        else:
            print(F"{variable} is not an existing variable!")
    elif inp in variables:
            print(variables[inp])
    elif inp == "EXIT":
        exit()
    else:
        if inp != "":
            print(f"Syntax Error: {inp} is not valid!")
        else:
            pass
while True:
    cmd = input("BASIC > ")
    READ(cmd)
