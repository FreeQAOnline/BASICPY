import os
instructions = []
while True:
    inp = input("JS > ")
    if inp.startswith("log"):
        instructions.append("console.log(" + inp[4::] + ")")
        for i in instructions:
            print(i)
    elif inp.startswith("exit"):
        exit()
    elif inp.startswith("variable"):
        variableName = inp[8::]
        variableValue = input("Enter the variable's value > ")
        if variableValue != "":
            instructions.append("var " + variableName + "=" + variableValue)
        else:
            instructions.append("var " + variableName)
        for i in instructions:
            print(i)
    else:
        instructions.append(inp)
