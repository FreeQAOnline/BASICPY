/* A parser for a BASIC interpreter */

#include <iostream>
#include <string>
using namespace std;
class Tokens{
public:
      
      // Statement token
      enum statementToken{
            IF,
            WHILE,
            DO,
            FOR,
            INLINE_ASSEMBLY,
            LOGIC_GATE,
            CALL,
            CLASS,
            AUTOMATIC_POINTER,
            MANUAL_POINTER,
            MANUAL_ARRAY,
            AUTOMATIC_ARRAY,
            INTEGER8,
            STRING8,
            FLOAT8,
            FLOAT16,
            STRING16,
            INTEGER16,
            FLOAT32,
            STRING32,
            INTEGER32,
            FLOAT64,
            INTEGER64,
            STRING64,
      }
      
      // Types token
      enum typesToken{
            INTEGER8,            /* An 8 bit integer */
            FLOAT8,               /* An 8 bit float */
            STRING8,           /*   An 8 bit string */
            STRING16,         /* A 16 bit string */
            INTEGER16,       /* A 16 bit integer */
            FLOAT16,        /* A 16 bit float */
            STRING32,      /* A 32 bit string */
            INTEGER32,    /* A 32 bit integer */
            FLOAT32,     /* A 32 bit decimal */
            STRING64,   /* A 64 bit string */
            INTEGER64, /* A 64 bit integer */
            FLOAT64,  /* A 64 bit double */
      }
};
int main(){
      Tokens token;
      return 0;
}
