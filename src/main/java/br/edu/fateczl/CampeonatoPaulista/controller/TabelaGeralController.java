package br.edu.fateczl.CampeonatoPaulista.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.CampeonatoPaulista.model.Times;
import br.edu.fateczl.CampeonatoPaulista.persistence.TabelaGeralDao;

@Controller
public class TabelaGeralController {

	@Autowired
	TabelaGeralDao cDao;

	@RequestMapping(name = "tabelaGeral", value = "/tabelaGeral", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		String erro = "";
		List<Times> times = new ArrayList<Times>();
		try {
			times = cDao.tabelaGeral();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("times", times);
		}
		return new ModelAndView("tabelaGeral");
	}

	@RequestMapping(name = "tabelaGeral", value = "/tabelaGeral", method = RequestMethod.POST)
	public ModelAndView novoCampeonato(ModelMap model, @RequestParam Map<String, String> allParam) {

		String botaoGerarTabela = allParam.get("botaoTabela");
		String botaoNovaTabela = allParam.get("botaoNovaTabela");
		String erro = "";

		List<Times> times = new ArrayList<Times>();

		try {
			if (botaoGerarTabela != null && !botaoGerarTabela.isEmpty()  ) {
				times = cDao.tabelaGeral();
			}
			if (botaoNovaTabela != null &&  !botaoNovaTabela.isEmpty() ) {
				cDao.gerarNovaTabela();
				times = cDao.tabelaGeral();
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}
		finally {
			model.addAttribute("erro", erro);
			model.addAttribute("times", times);
		}
		return new ModelAndView("tabelaGeral");
	}
}
