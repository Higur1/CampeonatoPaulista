package br.edu.fateczl.CampeonatoPaulista.model;

public class Classificatoria {
	private String nomeGrupo;
	private String nomeTime;
	public String getNomeGrupo() {
		return nomeGrupo;
	}
	public void setNomeGrupo(String nomeGrupo) {
		this.nomeGrupo = nomeGrupo;
	}
	public String getNomeTime() {
		return nomeTime;
	}
	public void setNomeTime(String nomeTime) {
		this.nomeTime = nomeTime;
	}
	@Override
	public String toString() {
		return "Classificatoria [nomeGrupo=" + nomeGrupo + ", nomeTime=" + nomeTime + "]";
	}
}
