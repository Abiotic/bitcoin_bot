//= require jquery.flot
//= require jquery.flot.time

$(function() {


	currencies = JSON.parse(currencies.replace(/&quot;/g,'"'));

	var course_graph_rur = [];
	var course_graph_eur = [];

	for (i = 0; i < currencies.length; i++) {
		course_graph_rur.push([i,currencies[i].btc_rur_cource]);
		course_graph_eur.push([i,currencies[i].btc_eur_cource]);
	}

	$.plot("#chart", [ course_graph_eur ]);

});