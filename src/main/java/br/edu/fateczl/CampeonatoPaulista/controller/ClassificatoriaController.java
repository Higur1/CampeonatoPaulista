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

import br.edu.fateczl.CampeonatoPaulista.model.Classificatoria;
import br.edu.fateczl.CampeonatoPaulista.persistence.ClassificatoriaDao;

@Controller
public class ClassificatoriaController {

	@Autowired
	ClassificatoriaDao cl;

	@RequestMapping(name = "classificatoria", value = "/classificatoria", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		String erro = "";

		List<Classificatoria> lista = new ArrayList<Classificatoria>();
		try {
			lista = cl.listaDeTimes();
			System.out.println(lista);
		} catch (ClassNotFoundException | SQLException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("lista", lista);
		}
		return new ModelAndView("classificatoria");
	}
}
