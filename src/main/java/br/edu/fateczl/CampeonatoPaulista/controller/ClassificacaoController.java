package br.edu.fateczl.CampeonatoPaulista.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.CampeonatoPaulista.model.Classificacao;
import br.edu.fateczl.CampeonatoPaulista.persistence.ClassificacaoDao;

@Controller
public class ClassificacaoController {

	@Autowired
	ClassificacaoDao gpDao;

	@RequestMapping(name = "classificacao", value = "/classificacao", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		String erro = "";
		List<Classificacao> classificacao = new ArrayList<Classificacao>();
		try {
			classificacao = gpDao.ListGroupos();
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("classificacao", classificacao);
		}
		return new ModelAndView("classificacao");
	}
}
