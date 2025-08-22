package br.fiap.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    private final static String url = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
    private final static String user = "pf0015";
    private final static String password = "fiap25";

    private Conexao() {}

    public static Connection conectar() {
        try {
            return DriverManager.getConnection(url, user, password);
        }
        catch(SQLException e) {
            System.out.println("erro ao conectar no banco\n" + e);
        }
        return null;
    }

}
