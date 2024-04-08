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
    elif inp.startswith("repeat"):
        iterator = input("INC or DEC? ")
        if iterator == "INC":
            iteratorName = input("Enter iterator name > ")
            instruction = "for(var " + iteratorName + " = 0; " + iteratorName + " < " + input("Enter the amount of times you want to increment > ") + "; i++){" + input("Action > ") + "}"
            instructions.append(instruction)
        else:
            iteratorName = input("Enter iterator name > ")
            instruction = "for(var " + iteratorName + " = 0; " + iteratorName + " < " + input("Enter the amount of times you want to decrement > ") + "; i--){" + input("ACtion > ") + "}"
            instructions.append(instruction)
    elif inp.startswith("save"):
        fileName = inp[5::]
        if not os.path.exists(fileName):
            with open(fileName, "w") as wf:
                for instruction in instructions:
                    wf.write(instruction)
                wf.close()
    elif inp.startswith("infinite"):
        instruction = "while(true){" + input("Enter what you want to repeat an infinite amount of time > ") + "}"
        instructions.append(instruction)
    elif inp.startswith("variable"):
        variableName = inp[9::]
        variableValue = input("Enter the variable's value > ")
        if variableValue != "":
            instructions.append("var " + variableName + "=" + variableValue)
        else:
            instructions.append("var " + variableName)
        for i in instructions:
            print(i)
    else:
        instructions.append(inp)
