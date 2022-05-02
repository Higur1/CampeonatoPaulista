package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.CampeonatoPaulista.model.Classificatoria;

public interface IClassificatoria {
	public List<Classificatoria> listaDeTimes() throws ClassNotFoundException, SQLException;
}
