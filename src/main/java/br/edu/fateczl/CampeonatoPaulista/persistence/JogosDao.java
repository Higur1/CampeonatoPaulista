package br.edu.fateczl.CampeonatoPaulista.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.edu.fateczl.CampeonatoPaulista.model.Jogos;

@Repository
public class JogosDao implements IJogosDao {

	@Autowired
	GenericDao gDao;

	@Override
	public List<Jogos> buscarJogoPorData(String data) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<Jogos> jogos = new ArrayList<Jogos>();

		String sql = "EXEC sp_selecionar_por_data ?";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setDate(1, Date.valueOf(data));
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Jogos jogo = new Jogos();
			jogo.setData(rs.getDate("dataJogo").toLocalDate());
			jogo.setTimeA(rs.getString("TimeA"));
			jogo.setGolsPro(rs.getInt("golsTimeA"));
			jogo.setGolsContra(rs.getInt("golsTimeB"));
			jogo.setTimeB(rs.getString("TimeB"));
			jogo.setEstadio(rs.getString("estadio"));
			jogo.setId(rs.getInt("id"));
			jogos.add(jogo);
		}
		rs.close();
		ps.close();
		c.close();
		return jogos;
	}

	@Override
	public void inserirGols(String id, String gols, int cod) throws SQLException, ClassNotFoundException {
		
		Connection c = gDao.getConnection();
		
		String sql = "EXEC sp_atualizar_jogos ?,?,?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, gols);
		ps.setInt(3, cod);
	
		ps.executeUpdate();
		ps.close();
		c.close();
	}
	@Override
	public String buscarData() throws SQLException, ClassNotFoundException{
		Connection c = gDao.getConnection();
		String data = null;
		String sql = "EXEC sp_buscar_data";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			data = rs.getString("datas");
		}
		ps.close();
		rs.close();
		return String.valueOf(data);
	}
	@Override
	public void salvarData(String data, int cod)throws SQLException, ClassNotFoundException{
		Connection c = gDao.getConnection();
		String sql = "EXEC sp_data_salva ?, ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, data);
		ps.setInt(2, cod);
		ps.executeUpdate();
		
		ps.close();
		
	}
	
}
