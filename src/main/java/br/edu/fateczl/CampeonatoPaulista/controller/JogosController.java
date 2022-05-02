package br.edu.fateczl.CampeonatoPaulista.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.CampeonatoPaulista.model.Jogos;
import br.edu.fateczl.CampeonatoPaulista.persistence.JogosDao;

@Controller
public class JogosController {

	@Autowired
	JogosDao jDao;

	@RequestMapping(name = "jogos", value = "/jogos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		String erro = "";
		String dataDefault;
		List<Jogos> jogos = new ArrayList<Jogos>();
		try {
			dataDefault = jDao.buscarData();
			jogos = jDao.buscarJogoPorData(dataDefault);
			if (jogos.isEmpty()) {
				jogos = jDao.buscarJogoPorData("2021-02-28");
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("jogos", jogos);
		}
		return new ModelAndView("jogos");
	}

	@RequestMapping(name = "jogos", value = "/jogos", method = RequestMethod.POST)
	public ModelAndView jogos(ModelMap model, @RequestParam Map<String, String> single,
			@RequestParam MultiValueMap<String, String> allParam) {
		String botaoData = single.get("botaoData");
		List<String> id = allParam.get("id{}");
		List<String> golsA = allParam.get("golsA{}");
		List<String> golsB = allParam.get("golsB{}");
		String dataDefault = "2021-02-28";
		String erro = "";
		List<Jogos> jogos = new ArrayList<Jogos>();

		try {
			if (botaoData.isEmpty()) {
				botaoData = jDao.buscarData();
			} else {
				jDao.salvarData(botaoData, 1);
			}
			jogos = jDao.buscarJogoPorData(botaoData);
			if (jogos.isEmpty()) {
				jDao.salvarData(dataDefault, 1);
				jogos = jDao.buscarJogoPorData(dataDefault);
			}
			for (int i = 0; i < id.size(); i++) {
				if (jogos.get(i).getGolsPro() != Integer.parseInt(golsA.get(i))
						&& jogos.get(i).getId() == Integer.parseInt(id.get(i))) {
					jDao.inserirGols(id.get(i), golsA.get(i), 1);
				}
				if (jogos.get(i).getGolsContra() != Integer.parseInt(golsB.get(i))
						&& jogos.get(i).getId() == Integer.parseInt(id.get(i))) {
					jDao.inserirGols(id.get(i), golsB.get(i), 2);
				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("jogos", jogos);
		}
		return new ModelAndView("jogos");
	}
}
