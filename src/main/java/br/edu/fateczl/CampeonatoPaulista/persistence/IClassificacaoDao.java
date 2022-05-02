package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.CampeonatoPaulista.model.Classificacao;

public interface IClassificacaoDao {
	public List<Classificacao> ListGroupos() throws SQLException, ClassNotFoundException;
}
