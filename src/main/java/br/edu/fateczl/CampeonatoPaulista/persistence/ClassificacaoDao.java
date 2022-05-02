package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.edu.fateczl.CampeonatoPaulista.model.Classificacao;

@Repository
public class ClassificacaoDao implements IClassificacaoDao {

	@Autowired
	GenericDao gDao;

	@Override
	public List<Classificacao> ListGroupos() throws SQLException, ClassNotFoundException {

		Connection c = gDao.getConnection();

		List<Classificacao> classificacao = new ArrayList<Classificacao>();

		String sql = "EXEC sp_selecionar_grupos";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Classificacao classi = new Classificacao();
			classi.setNomeGrupo(rs.getString("nomeGrupo"));
			classi.setNomeTime(rs.getString("nomeTime"));
			classi.setPontos(rs.getInt("pontos"));
			classi.setVitorias(rs.getInt("vitorias"));
			classi.setEmpates(rs.getInt("empates"));
			classi.setDerrotas(rs.getInt("derrotas"));
			classi.setGolsPro(rs.getInt("golsPro"));
			classi.setGolsContra(rs.getInt("golsContra"));
			classi.setSaldoGols(rs.getInt("saldoGols"));
			classificacao.add(classi);
		}
		rs.close();
		ps.close();
		c.close();
		return classificacao;
	}

}
