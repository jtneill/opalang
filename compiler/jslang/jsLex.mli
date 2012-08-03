(*
    Copyright © 2011 MLstate

    This file is part of Opa.

    Opa is free software: you can redistribute it and/or modify it under the
    terms of the GNU Affero General Public License, version 3, as published by
    the Free Software Foundation.

    Opa is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
    more details.

    You should have received a copy of the GNU Affero General Public License
    along with Opa. If not, see <http://www.gnu.org/licenses/>.
*)

(**
   The javascript lexer

   Beware that the lexer is stateful, so it should not be used
   by several threads simultaneously, nor should you try to intersperse
   the lexing of several inputs

   This module is not meant to be called directly, use instead the high level
   functions provided in jsParse if you want to parse some javascript.
*)

type token =
  | Yield
  | With
  | While
  | Void
  | Var
  | Typeof
  | Try
  | True
  | TimesEqual
  | Times
  | Tilda
  | Throw
  | This
  | Switch
  | Super
  | String of (string)
  | Static
  | Semic
  | Rparen
  | Return
  | Regexp of (string * string)
  | Rcurly
  | Rbracket
  | Question
  | Public
  | Protected
  | Private
  | PlusPlus
  | PlusEqual
  | Plus
  | PercentEqual
  | Percent
  | Package
  | Null
  | New
  | MinusMinus
  | MinusEqual
  | Minus
  | LtLtEqual
  | LtLt
  | Lt
  | Lparen
  | Let
  | Le
  | Lcurly
  | Lbracket
  | LT
  | Interface
  | Integer of (string)
  | Instanceof
  | In
  | Import
  | Implements
  | If
  | Ident of (string)
  | GtGtGtEqual
  | GtGtGt
  | GtGtEqual
  | GtGt
  | Gt
  | Ge
  | Function
  | For
  | Finally
  | False
  | Extends
  | Export
  | EqualEqualEqual
  | EqualEqual
  | Equal
  | Enum
  | Else
  | EOF
  | Dot
  | Do
  | DivEqual
  | Div
  | Delete
  | Default
  | Debugger
  | Continue
  | Const
  | Comma
  | Colon
  | Class
  | ChapeauEqual
  | Chapeau
  | Catch
  | Case
  | Break
  | BarEqual
  | BarBar
  | Bar
  | BangEqualEqual
  | BangEqual
  | Bang
  | AmperEqual
  | AmperAmper
  | Amper

  (* These tokens are used only when parsing comments for bsl files
     and are not produced in normal lexing*)
  | OpenDocComment
  | CloseComment
  | CommentLine of string
  | CommentTag of string * string

val string_of_token : token -> string
val init_lexer : unit -> unit
val lex : bool -> Lexing.lexbuf -> token
val stream : bool -> Lexing.lexbuf -> token Stream.t

(**
   These high level functions automatically init the lexer
   when called
*)
val stream_of_file : ?lex_comments:bool -> string -> token Stream.t * Lexing.lexbuf
val stream_of_string : ?lex_comments:bool -> string -> token Stream.t * Lexing.lexbuf
