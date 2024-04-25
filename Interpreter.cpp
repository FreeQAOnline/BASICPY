#include <iostream>
#include <string>
#include <map>
#include "Interpreter.h"
using namespace std;

// A struct for the data type tokens
struct DataTypeTokens {
	enum DataTypes {
		STRING,
		FLOAT,
		INT,
		CONST,
		CHAR,
	};
};

// A struct for the keyword tokens
struct Keywords {
	enum KeywordTokens {
		INTEGER8,
		INTEGER16,
		INTEGER32,
		INTEGER64,
		STRING8,
		STRING16,
		STRING32,
		STRING64,
		FLOAT8,
		FLOAT16,
		FLOAT32,
		FLOAT64,
		CHAR8,
		CHAR16,
		CHAR32,
		CHAR64,
		INLINE_ASSEMBLY,
		AUTOMATIC_POINTER,
		MANUAL_POINTER,
		PRINT,
	};
};

// Hold the token
struct Tokens {
		DataTypeTokens dataTypeTokens;
		Keywords keywords;
};


// Send the token to the interpreter

// I am going to write a function that maps a keyword to a token, so I can just call a function instead of constantly recreating
// a dictionary and iterating over it each time an instruction needs to be parsed.

// Parse an instruction

string ParseInstruction(string instruction) {
	Tokens tokens;
	map<string, int>keywords = {
		{"PRINT",	 tokens.keywords.PRINT}, 
		{"INT8",     tokens.keywords.INTEGER8},
		{"INT16",    tokens.keywords.INTEGER16},
		{"INT32",    tokens.keywords.INTEGER32},
		{"INT64",    tokens.keywords.INTEGER64},
		{"FLOAT8",   tokens.keywords.FLOAT8},
		{"FLOAT16",  tokens.keywords.FLOAT32},
		{"FLOAT64",  tokens.keywords.FLOAT64},
		{"CHAR8",    tokens.keywords.CHAR8},
		{"CHAR16",   tokens.keywords.CHAR16},
		{"CHAR32",   tokens.keywords.CHAR32},
		{"CHAR64",   tokens.keywords.CHAR64},
		{"STRING8",  tokens.keywords.STRING8},
		{"STRING16", tokens.keywords.STRING16},
		{"STRING32", tokens.keywords.STRING32},
		{"STRING64", tokens.keywords.STRING64},
		{"ASM",		 tokens.keywords.INLINE_ASSEMBLY},
		{"AUTOMATIC_POINTER", tokens.keywords.AUTOMATIC_POINTER},
		{"MANUAL_POINTER", tokens.keywords.MANUAL_POINTER}, 
	};

	// I need to iterate over the dictionary, so I'll setup a basic for loop. This is so I can go through each index in the
	// Dictionary and check if the user input is equal to that specific value and if it is not, compare it by the iteratorTimes 
	// variable and if it is equal to a specific number it'll output `user input value` not found.
	for (int i = 0; i < 19; i++) {

		// Continue here...
		// How stupid am I? I don't even know how to iterate over this dictionary.	
		// 10:34 PM: (A couple hours later): I think I've figured it out. I'll make a new dictionary with the reverse order of the
		// previous dictionary
		std::map<int, string>IAmAnIdiot = {
			{tokens.keywords.PRINT, "PRINT"},
			{tokens.keywords.INTEGER8, "INT8"},
			{tokens.keywords.INTEGER16, "INT16"},
			{tokens.keywords.INTEGER32, "INT32"},
			{tokens.keywords.INTEGER64, "INT64"},
			{tokens.keywords.FLOAT8, "FLOAT8"},
			{tokens.keywords.FLOAT16, "FLOAT16"},
			{tokens.keywords.FLOAT32, "FLOAT32"},
			{tokens.keywords.FLOAT64, "FLOAT64"},
			{tokens.keywords.CHAR16, "CHAR16"},
			{tokens.keywords.CHAR32, "CHAR32"},
			{tokens.keywords.CHAR64, "CHAR64"}, 
			{tokens.keywords.STRING16, "STRING16"},
			{tokens.keywords.STRING32, "STRING32"}, 
			{tokens.keywords.STRING64, "STRING64"},
			{tokens.keywords.INLINE_ASSEMBLY, "ASM"},
			{tokens.keywords.AUTOMATIC_POINTER, "AUTOMATIC_POINTER"}, 
			{tokens.keywords.AUTOMATIC_POINTER, "AUTOMATIC_POINTER"},
			{tokens.keywords.MANUAL_POINTER, "MANUAL_POINTER"}, 
		};
		
		// I am such an idiot, but I somehow figured it out.
		// I am going to iterate over the dictionary, so I can get each string value of each token.
	
		int iteratorTimes = 0;
		
		for (int i = 0; i < 19; i++) {
			if (IAmAnIdiot[i] == instruction) {
				string ins = IAmAnIdiot[i];
				int intEquivalentOfIns = keywords[ins];
				string stringEquivalentOfInt = to_string(intEquivalentOfIns);
				return stringEquivalentOfInt;
				break;
			}else {
				iteratorTimes = iteratorTimes + 1;
				if (iteratorTimes == 18) {
					return instruction + " is not an existing instruction!";
					break;
				}
				else {	
					return instruction + " is not an existing instruction!";
					continue;
				}
			}
		}
	}

	// I am returning the keyword, so when the function is called in such a way it will output it. For example, 
	// cout << ParseInstruction(instruction); will output the instruction requested if it exists.
}

int main() {

	// I am going to create two strings. The convertedInstruction string will hold the parsed user input and the instruction string
   //  will store the user input.

	string convertedInstruction;
	string instruction;
	
	while (true) {
		cout << "BASIC > ";
		cin >> instruction;
		convertedInstruction = ParseInstruction(instruction); // I am doing this so it parses the user input.
		// The reason why I am setting the `convertedInstruction` string's value to the parsed instruction is because I wanted
		// to output the mapped equivalent.
		cout << convertedInstruction << endl;
	}
	return 0;
}