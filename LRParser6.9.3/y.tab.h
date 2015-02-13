/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     NUM = 259,
     COMMENTS = 260,
     IF = 261,
     ELSE = 262,
     WHILE = 263,
     THEN = 264,
     REAL = 265,
     INT = 266,
     GT = 267,
     GE = 268,
     LE = 269,
     LT = 270,
     EEQ = 271,
     EQ = 272,
     NE = 273,
     ADD = 274,
     MIN = 275,
     MUL = 276,
     DIV = 277,
     LPAR = 278,
     RPAR = 279,
     LBRACES = 280,
     RBRACES = 281,
     SemicolSym = 282
   };
#endif
/* Tokens.  */
#define ID 258
#define NUM 259
#define COMMENTS 260
#define IF 261
#define ELSE 262
#define WHILE 263
#define THEN 264
#define REAL 265
#define INT 266
#define GT 267
#define GE 268
#define LE 269
#define LT 270
#define EEQ 271
#define EQ 272
#define NE 273
#define ADD 274
#define MIN 275
#define MUL 276
#define DIV 277
#define LPAR 278
#define RPAR 279
#define LBRACES 280
#define RBRACES 281
#define SemicolSym 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 33 "first.y"

	struct treeNode *treenode;
	


/* Line 2068 of yacc.c  */
#line 110 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


