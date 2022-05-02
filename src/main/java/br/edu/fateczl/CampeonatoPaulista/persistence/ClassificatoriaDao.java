package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.edu.fateczl.CampeonatoPaulista.model.Classificatoria;

@Repository
public class ClassificatoriaDao implements IClassificatoria{

	@Autowired
	GenericDao gDao;
	
	@Override
	public List<Classificatoria> listaDeTimes() throws ClassNotFoundException, SQLException {

		Connection c = gDao.getConnection();
		
		List<Classificatoria> lista = new ArrayList<Classificatoria>();
		String sql = "Exec sp_gerar_quartas";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Classificatoria cl = new Classificatoria();
			cl.setNomeGrupo(rs.getString("nomeGrupo"));
			cl.setNomeTime(rs.getString("nomeTime"));
			lista.add(cl);
		}
		rs.close();
		ps.close();
		c.close();
		return lista;
	}

}
