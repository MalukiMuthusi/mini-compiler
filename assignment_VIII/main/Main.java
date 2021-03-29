package main;

import java.io.IOException;

import lexer.Lexer;
import parser.*;
public class Main {
    public static void main(String[] args) {
        Lexer lex = new Lexer();
        Parser parse;
        try {
            parse = new Parser(lex);
            parse.program();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        System.out.println('\n');
    }
}