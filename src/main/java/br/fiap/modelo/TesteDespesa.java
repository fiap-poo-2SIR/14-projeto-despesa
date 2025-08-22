package br.fiap.modelo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class TesteDespesa {
    public static void main(String[] args) {
        DespesaDAO dao = new DespesaDAO();
        DateTimeFormatter f = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        Despesa despesa = new Despesa();
        despesa.setDescricao("viagem de uber para a fiap");
        despesa.setValor(2500.00);
        despesa.setData(LocalDate.parse("21/08/2025", f));
        despesa.setCategoria(new Categoria(1L, ""));
        dao.inserir(despesa);
    }
}
