package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.edu.fateczl.CampeonatoPaulista.model.Times;

@Repository
public class TabelaGeralDao implements ITabelaGeralDao {

	@Autowired
	GenericDao gDao;

	@Override
	public List<Times> tabelaGeral() throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<Times> times = new ArrayList<Times>();

		String sql = "EXEC sp_gerar_tabela_geral";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Times time = new Times();
			time.setNome(rs.getString("nomeTime"));
			time.setPontos(rs.getInt("pontos"));
			time.setVitorias(rs.getInt("vitorias"));
			time.setEmpates(rs.getInt("empates"));
			time.setDerrotas(rs.getInt("derrotas"));
			time.setGolsPro(rs.getInt("golsPro"));
			time.setGolsContra(rs.getInt("golsContra"));
			time.setSaldoGols(rs.getInt("saldoGols"));
			times.add(time);
		}
		rs.close();
		ps.close();
		c.close();
		return times;
	}
	@Override
	public void gerarNovaTabela()throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		
		String sql = "EXEC sp_gerar_novo_campeonato";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
		c.close();
	}
}
