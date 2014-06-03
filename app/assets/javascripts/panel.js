//= require jquery.flot
//= require jquery.flot.time

$(function() {

	$('#update_currency_graph').ajaxForm({
		success: update_currency_graph_result,
		beforeSubmit: update_currency_graph_before_submit
	});

	$('#update_graph').click(function(){
		$('#update_currency_graph').submit();
	});

	$('#update_currency_graph').submit();

});

function updateGraph(currencies) {

	var course_graph_usd = [];
	var course_graph_eur = [];

	for (var i = 0; i < currencies.length; i++) {
		course_graph_usd.push([i,currencies[i].btc_usd_cource]);
		course_graph_eur.push([i,currencies[i].btc_eur_cource]);
	}

	$.plot("#chart", [ course_graph_usd ]);
}

function update_currency_graph_result(response){
	updateGraph(response);
}

function update_currency_graph_before_submit(){

}