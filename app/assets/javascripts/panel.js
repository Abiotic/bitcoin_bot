//= require jquery.flot
//= require jquery.flot.time

$(function() {

	$('.choose_course').click(function(){
		$('#course').val($(this).val());

	});

	$('#update_currency_graph').ajaxForm({
		success: update_currency_graph_result,
		beforeSubmit: update_currency_graph_before_submit
	});


	$('#update_currency_graph').submit();

});

function updateGraph(data) {

	var course_graph = [];

	for (var i = 0; i < data.length; i++) {
		course_graph.push([i,data[i].course]);
	}

	$.plot("#chart", [
				{ data: course_graph, label: parseCurrencyName($('#course').val()) },
				],{
		xaxis: {
			mode: "time",
			font: {
				size: 10,
				color: "grey"
			}
		},
		series: {
			color: "#aaa",
			lines: {
				lineWidth: 2
			},
			shadowSize: 0
		},
		grid: {
			borderWidth: 1,
			minBorderMargin: 0,
			labelMargin: 4,
			backgroundColor: "#fff"
		}
	});

}

function parseCurrencyName(cur) {
	return cur.slice(0, 3).toUpperCase() + "/" +  cur.slice(4,7).toUpperCase();
}

function update_currency_graph_result(response){
	updateGraph(response);
}

function update_currency_graph_before_submit(){

}