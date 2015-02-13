/*
 *	Header for LLParser
*/

#define NSYMS 20	/* maximum number of symbols */

struct symtab {
	char *name;
	double value;
	int lineCount;
	int wordCount;
} symtab[NSYMS];


struct symtab *symlook();




