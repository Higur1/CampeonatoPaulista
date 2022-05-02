package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.CampeonatoPaulista.model.Jogos;

public interface IJogosDao {
	public List<Jogos> buscarJogoPorData(String data) throws SQLException, ClassNotFoundException;
	public void inserirGols(String id, String gols, int cod) throws SQLException, ClassNotFoundException;
	public String buscarData() throws SQLException, ClassNotFoundException;
	public void salvarData(String data, int cod)throws SQLException, ClassNotFoundException;
}
