package br.edu.fateczl.CampeonatoPaulista.model;

public class Classificacao {
	private String nomeGrupo;
	private int posicao;
	private int pontos;
	private int vitorias;
	private int empates;
	private int derrotas;
	private int golsPro;
	private int golsContra;
	private int saldoGols;
	private String nomeTime;

	public String getNomeGrupo() {
		return nomeGrupo;
	}

	public void setNomeGrupo(String nomeGrupo) {
		this.nomeGrupo = nomeGrupo;
	}

	public int getPosicao() {
		return posicao;
	}

	public void setPosicao(int posicao) {
		this.posicao = posicao;
	}

	public String getNomeTime() {
		return nomeTime;
	}

	public void setNomeTime(String nomeTime) {
		this.nomeTime = nomeTime;
	}

	public int getPontos() {
		return pontos;
	}

	public void setPontos(int pontos) {
		this.pontos = pontos;
	}

	public int getVitorias() {
		return vitorias;
	}

	public void setVitorias(int vitorias) {
		this.vitorias = vitorias;
	}

	public int getEmpates() {
		return empates;
	}

	public void setEmpates(int empates) {
		this.empates = empates;
	}

	public int getDerrotas() {
		return derrotas;
	}

	public void setDerrotas(int derrotas) {
		this.derrotas = derrotas;
	}

	public int getGolsPro() {
		return golsPro;
	}

	public void setGolsPro(int golsPro) {
		this.golsPro = golsPro;
	}

	public int getGolsContra() {
		return golsContra;
	}

	public void setGolsContra(int golsContra) {
		this.golsContra = golsContra;
	}

	public int getSaldoGols() {
		return saldoGols;
	}

	public void setSaldoGols(int saldoGols) {
		this.saldoGols = saldoGols;
	}

	@Override
	public String toString() {
		return "Classificacao [nomeGrupo=" + nomeGrupo + ", pontos=" + pontos + ", vitorias=" + vitorias + ", empates="
				+ empates + ", derrotas=" + derrotas + ", golsPro=" + golsPro + ", golsContra=" + golsContra
				+ ", saldoGols=" + saldoGols + ", nomeTime=" + nomeTime + "]";
	}

}