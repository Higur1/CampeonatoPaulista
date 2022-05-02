package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.CampeonatoPaulista.model.Times;

public interface ITabelaGeralDao {
	public List<Times> tabelaGeral() throws SQLException, ClassNotFoundException;
	public void gerarNovaTabela()throws SQLException, ClassNotFoundException;
}
