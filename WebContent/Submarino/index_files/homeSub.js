setTimeout('inicia_click()',2000);

function inicia_click(){
	
	clickAnalyticsAll('a#allStoreTitle','homesub','naveguepelaslojas');
	clickAnalyticsAll('ul.departments li.item','homesub','menunavegacao');
	clickAnalyticsAll('ul.departments input.optionDelivery','homesub','personalizeloja');
	clickAnalyticsAll('li#li0 h2','homesub','top5livrostopo');
	clickAnalyticsAll('li#li0 div.box3ATop5','homesub','top5livrositens');
	clickAnalyticsAll('li#li1 h2','homesub','top5cdstopo');
	clickAnalyticsAll('li#li1 div.box3A','homesub','top5cdsitens');
	clickAnalyticsAll('li#li2 h2','homesub','top5dvdstopo');
	clickAnalyticsAll('li#li2 div.box3A','homesub','top5dvdsitens');
	clickAnalyticsAll('div.worldsMenu ul.list3','homesub','mundos');
	clickAnalyticsBoxServicos('div.digitalServicesMenu ul.list3 li a','homesub');
	clickAnalyticsAll('div.partnersMenu ul.list3','homesub','parceiros');
	clickAnalyticsAll('div#area3 ul.tagCloud','homesub','tagcloud');
	clickAnalyticsMiolo('div.homeProductList div.product','homesub');
	clickAnalyticsLeft('div.myMenuBox div.box1','homesub');
	clickAnalyticsConfira('ul.others li ul li','homesub');
	
}

function clickAnalyticsAll(seletor,nomePagina,nomeArea){
	$$(seletor).each( function(i) { 
		i.observe('click', function() {
			pageTracker._trackEvent(nomePagina, 'click', nomeArea);
			//alert(nomePagina+' '+nomeArea);
		});
	});
};

function clickAnalyticsMiolo(seletor,nomePagina){
	$$(seletor).each( function(e, index,as) {
		e.observe('click', function() {
			if(index == 0 || index == 1 || index == 2){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo1-'+posicao);
				//alert(nomePagina+' miolo1-'+posicao);
			}
			if(index == 3 || index == 4 || index == 5){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo2-'+posicao);
				//alert(nomePagina+' miolo2-'+posicao);
			}
			if(index == 6 || index == 7 || index == 8){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo3-'+posicao);
				//alert(nomePagina+' miolo3-'+posicao);
			}
			if(index == 9 || index == 10 || index == 11){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo4-'+posicao);
				//alert(nomePagina+' miolo4-'+posicao);
			}
			if(index == 12 || index == 13 || index == 14){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo5-'+posicao);
				//alert(nomePagina+' miolo5-'+posicao);
			}
			if(index == 15 || index == 16 || index == 17){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo6-'+posicao);
				//alert(nomePagina+' miolo6-'+posicao);
			}
			if(index == 18 || index == 19 || index == 20){
				var posicao = parseInt(index)+1;
				pageTracker._trackEvent(nomePagina, 'click', 'miolo7-'+posicao);
				//alert(nomePagina+' miolo7-'+posicao);
			}
		});
	});
};

function clickAnalyticsLeft(seletor,nomePagina){
	$$(seletor).each( function(e, index) {
		e.observe('click', function() {
			if(index == 0){
				pageTracker._trackEvent(nomePagina, 'click', 'centralpromocoes');
				//alert(nomePagina+' centralpromocoes');
			}
			if(index == 1){
				pageTracker._trackEvent(nomePagina, 'click', 'artistasautores');
				//alert(nomePagina+' artistasautores');
			}
			if(index == 2){
				pageTracker._trackEvent(nomePagina, 'click', 'colecoesdestaques');
				//alert(nomePagina+' colecoesdestaques');
			}
			if(index == 3){
				pageTracker._trackEvent(nomePagina, 'click', 'prevendas');
				//alert(nomePagina+' prevendas');
			}
			if(index == 4){
				pageTracker._trackEvent(nomePagina, 'click', 'minhalistadesejos');
				//alert(nomePagina+' minhalistadesejos');
			}
			if(index == 5){
				pageTracker._trackEvent(nomePagina, 'click', 'marcas');
				//alert(nomePagina+' marcas');
			}
		});
	});
};

function clickAnalyticsConfira(seletor,nomePagina){
	$$(seletor).each( function(e, index) {
		e.observe('click', function() {
			if(index == 0){
				pageTracker._trackEvent(nomePagina, 'click', 'confira_viagens');
				//alert(nomePagina+' confira_viagens');
			}
			if(index == 1){
				pageTracker._trackEvent(nomePagina, 'click', 'confira_ingressos');
				//alert(nomePagina+' confira_ingressos');
			}
			if(index == 2){
				pageTracker._trackEvent(nomePagina, 'click', 'confira_cartao');
				//alert(nomePagina+' confira_cartao');
			}
			if(index == 9){
				pageTracker._trackEvent(nomePagina, 'click', 'confira_aluguel');
				//alert(nomePagina+' confira_aluguel');
			}
		});
	});
};

function clickAnalyticsBoxServicos(seletor,nomePagina){
	$$(seletor).each( function(e, index) {
		e.observe('click', function() {
			if(index == 0){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_sub_mais');
				//alert(nomePagina+' servicos_sub_mais');
			}
			if(index == 1){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_revelacao');
				//alert(nomePagina+' servicos_revelacao');
			}
			if(index == 2){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_smartphone');
				//alert(nomePagina+' servicos_smartphone');
			}
			if(index == 3){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_Cpresentes');
				//alert(nomePagina+' servicos_Cpresentes');
			}
			if(index == 4){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_lancamentos');
				//alert(nomePagina+' servicos_lancamentos');
			}
			if(index == 5){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_radar');
				//alert(nomePagina+' servicos_radar');
			}
			if(index == 6){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_desejos');
				//alert(nomePagina+' servicos_desejos');
			}
			if(index == 7){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_casamento');
				//alert(nomePagina+' servicos_casamento');
			}
			if(index == 8){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_Vpresente');
				//alert(nomePagina+' servicos_Vpresente');
			}
			if(index == 9){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_atomica');
				//alert(nomePagina+' servicos_atomica');
			}
			if(index == 10){
				pageTracker._trackEvent(nomePagina, 'click', 'servicos_corporativos');
				//alert(nomePagina+' servicos_corporativos');
			}
		});
	});
};