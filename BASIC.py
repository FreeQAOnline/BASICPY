OS_MODE = False
import os
variables = {}
instructions = {
    "INT": "This creates an integer",
    "STRING": "This creates a string",
    "PRINT": "This outputs stuff",
    "ADD":   "This adds two numbers",
    "FLOAT": "This creates a float",
    "EXIT":  "This exits the interpreter",
    "ENABLE_OS_MODE":    "Enable OS mode",
    "DISABLE_OS_MODE":   "Disable OS mode",
    "CLS":  "Clear the screen (Windows)",
    "CLEAR": "Clear the screen (Linux)", 
    "SETINT": "Change an integer's value",
    "DIVIDE": "Divide two variables",
    "MULTIPLY": "Multiply two numbers",
    "SUBTRACT": "Subtract two numbers",
    "SETSTR":   "This changes a string's value",
    "SETFLT": "This changes a float's value",
    "COMMENT": "This creates a comment",
}
instruction = []
instructionsArray = ["INT", "COMMENT", "STRING", "ADD", "EXIT", "SETINT", "SETFLT", "SETSTR", "FLOAT", "ENABLE_OS_MODE", "DISABLE_OS_MODE", "CLS", "CLEAR"]
def READ(inp):
    global OS_MODE
    if inp.startswith("INT"):
        variableName  = inp[4::]
        if not variableName in variables:
             variables[variableName] = int(input("Enter the variable's value > "))
        else:
            print(f"{variableName} already exists!")
        instruction.append(inp)
    elif inp == "ENABLE_OS_MODE":
        print("USE THIS AT YOUR OWN RISK...")
        OS_MODE = True
    elif inp == "DISABLE_OS_MODE":
        OS_MODE = False
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
        instruction.append(inp)
    elif inp.startswith("LIST"):
        for i in instruction:
            print(i)
        instruction.append(inp)
    elif inp.startswith("PRINT"):
        MSG = inp[6::]
        if MSG in variables:
            print(variables[MSG])
        else:
            print(MSG)
        instruction.append(inp)
    elif inp.startswith("HELP"):
            ins = inp[5::]
            if ins in instructions:
                print(instructions[ins])
            else:
                if ins != "":
                    print(f"The instruction {ins} does not exist")
                else:
                    for i in instructionsArray:
                        print(i)
            instruction.append(inp)
    elif inp.startswith("SUBTRACT"):
        variable1 = input("Enter the variable > ")
        variabl2 = input("Enter the other variable > ")
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variable1] - variables[variable2]
        instruction.append(inp)
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
        instruction.append(inp)
    elif inp.startswith("MULTIPLY"):
        variable1 = float(input("Enter a variable > "))
        variable2 = float(input("Enter another variable > "))
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variable1] * variables[variable2]
        else:
            print(f"The variables {variable1} and {variable2} are not defined!")
        instruction.append(inp)
    elif inp.startswith("ADD"):
        variable1 = input("Enter the variable > ")
        variable2 = input("Enter the other variable > ")
        if variable1 in variables and variable2 in variables:
            variables[variable1] = variables[variable1] + variables[variable2]
            print(f"The sum is {variables[variable1]}")
        else:
            print(f"The variables {variable1} and {variable2} do not exist!")
        instruction.append(inp)
    elif inp.startswith("SETINT"):
        variable = inp[6::]
        if variable in variables:
            variables[variable] = int(input("Enter the new value > "))
        else:
            print(f"{variable} is not an existing variable!")
        instruction.append(inp)
    elif inp.startswith("SETSTR"):
        variable = inp[6::]
        if variable in variables:
            variables[variable] = str(input("Enter the new value > "))
        else:
            print(f"{variable} is not an existing variable")
        instruction.append(inp)
    elif inp.startswith("SETFLT"):
        variable = inp[6::]
        if variable in variables:
            variables[variable] = float(input("Enter the new value > "))
        instruction.append(inp)
    elif inp.startswith("DEL"):
        variable = inp[4::]
        if variable in variables:
            del variables[variable]
            print(f"Deleted the variable {variable}")
        else:
            print(F"{variable} is not an existing variable!")
        instruction.append(inp)
    elif inp in variables:
            print(variables[inp])
    elif inp == "EXIT":
        exit()
    elif inp == "CLEAR":
        os.system(inp)
        instruction.append(inp)
    elif inp  == "CLS":
        os.system(inp)
        instruction.append(inp)
    elif inp.startswith("COMMENT"):
        pass
    else:
        if inp != "":
            if OS_MODE == False:
                print(f"Syntax Error: {inp} is not valid!")
            else:
                if not inp.startswith("chdir"):
                    os.system(inp)
                else:
                    if not inp[6::] == "":
                        os.chdir(inp[6::])          
        else:
            pass
while True:
    cmd = input("BASIC > ")
    READ(cmd)
