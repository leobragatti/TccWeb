
/* POLISHOP : BASE */
/* v1.0 */

	body
	{
		font-family: Arial, Helvetica, sans-serif;
		font-size: 11px;
		color: #828282;
	}
	
	div
	{
		display: block;
	}
	
	.barra-alerta
	{
		background-color: #ff0;
		cursor: default;
		height: 30px;
		line-height: 30px;
		text-align: center;
		text-transform: uppercase;
		box-shadow: inset 0 0 5px rgba(0,0,0,.2);
		-moz-box-shadow: inset 0 0 5px rgba(0,0,0,.2);
		-webkit-box-shadow: inset 0 0 5px rgba(0,0,0,.2);
	}
	
	.barra-alerta strong { color: #f00 }
	
	.barra-alerta span { padding-left: 20px }
		
	.ie6update
	{
		background-color: #fffff0;
		border-bottom: solid 3px #333;
		clear: both;
		display: block;
		height: 210px;
		margin: 0;
		padding: 0;
		position: relative;
		width: 100%;
	}
	
	.ie6update .alerta
	{
		clear: both;
		display: block;
		left: 50%;
		margin: 0 0 20px -490px;
		padding: 20px;
		position: relative;
		width: 940px;
	}
	
	.ie6update h2
	{
		clear: both;
		display: block;
		position: absolute;
		width: 693px;
		height: 31px;
		background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=ie6update.gif");
		background-position: -10px -10px;
		text-indent: -9999px;
	}
	
	.ie6update .coluna
	{
		clear: both;
		display: block;
	}
	
	.ie6update .coluna p
	{
		display: inline-block;
		font-size: 13px;
		float: left;
		line-height: 17px;
		margin-top: 45px;
		width: 450px;
	}
	
	.ie6update ul
	{
		display: inline-block;
		float: right;
		list-style: none;
		margin-top: 40px;
	}
	
	.ie6update ul li
	{
		display: inline-block;
		float: left;
		margin-left: 7px;
	}
	
	.ie6update ul li a
	{
		display: inline-block;
		width: 104px;
		height: 124px;
		background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=ie6update.gif");
		background-position: -10px -42px;
		text-indent: -9999px;
	}
	
	.ie6update ul li a.ie { background-position: -10px -42px }
	
	.ie6update ul li a.firefox { background-position: -115px -42px }
	
	.ie6update ul li a.chrome { background-position: -220px -42px }
	
	.ie6update ul li a.safari { background-position: -325px -42px }
	
	hr, 
	div#ctl00_TopBar_TopBar1_outerHeader h1, 
	ul.menu-user li#liMeuCadastro, 
	ul.menu-user li#meu-pedido, 
	ul.menu-user a#lnkCarrinho1, 
	div.searchWrapper,
	#header #conteudo #busca fieldset legend,
	#header #conteudo #busca fieldset label,
	#header #conteudo #busca fieldset select
	{
		display: none;
	}
	
	div#ctl00_TopBar_TopBar1_outerHeader
	{
		position: relative;
		float: left;
		width: 100%;
		height: 100px;
		top:0;
		margin:0 0 0 0;
	}
	
	#ctl00_TopBar_TopBar1_pnlTopBarAssincrono
	{
		position:relative;
		width: 980px;
		height:85px;
		top:0;
		left: 50%;
		margin: 0 0 -85px -490px;
	}
	
	#televendasfone
	{
		color: #bebebe;
		cursor: default;
		float: left;
		left: 50%;
		height: 20px;
		*height: 20px;
		overflow: hidden;
		position: relative;
		top: -35px;
		*top: 22px;
		margin-left: -80px;
		*margin-top: -45px;
		width:250px;
	}
	
	#televendasfone font { font-size:9px }
	
	div.welcome
	{
		width: 170px;
		height: auto;
		position: absolute;
		top: -17px;
		left: 0;
		padding: 15px 0 0 0;
		z-index: 999;
	}
	
		div.welcome strong, p.loginmsg a strong
		{
			font-weight: normal;
		}
	
		div.welcome em,
		p.loginmsg em,
		div#login em
		{
			clear: both;
			color: #bebebe;
			display: block;
			font-style: normal;
			padding-top: 3px;
		}
			
			div.welcome em a,
			p.loginmsg em a,
			div#login em a
			{
				color: #bebebe;
				text-decoration: none;
			}
			
			div.welcome em a:hover,
			p.loginmsg em a:hover,
			div#login em a:hover
			{
				text-decoration: underline;
			}
		
		div.welcome span#lblLoginMsg,
		div#login span#lblLoginMsg
		{
			font-weight:bold;
			color: #ee1d25;
		}
		
		a#lnkCarrinho2
		{
			display: none;
			position: absolute;
			width: 144px;
			height: 17px;
			background-image:url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
			background-position: -10px -10px;
			padding: 15px 0 0 6px;
			color: #FFF;
			z-index: 9000005;
		}
		
			a#lnkCarrinho2 strong { font-weight: normal; }
	
	#ctl00_TopBar_TopBar1_divHeader
	{
		position:relative;
		width: 100%;
		height:85px;
		top:0;
		margin: 0;
	}
	
	#ctl00_TopBar_TopBar1_pnlTopBarAssincrono
	{
		display: block;
		width: 150px;
		position: absolute;
		padding: 0;
		margin: 35px 0 0 -318px;
		z-index: 9000004;
	}
	
		#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg
		{
			padding-top: 3px;
			color: #bebebe;
			display: inline-block;
			font-style: normal;
			margin-left: 92px;
		}
		
			#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg em
			{
				font-style: normal;
			}
		
		#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg a#lnkLogin
		{
			font-style: normal;
			color: #bebebe;
			margin-left: -106px;
		}
		
			#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg a#lnkLogin:hover
			{
				text-decoration: underline;
			}
		
		ul#divMenuUsuario
		{
			display: block;
			position: relative;
			left: 108px;
			top: -11px;
		}
		
		ul#divMenuUsuario a#lnkCadastreSe
		{
			font-style: normal;
			color: #bebebe;
		}
		
			ul#divMenuUsuario a#lnkCadastreSe:hover
			{
				text-decoration: underline;
			}
		
	.legenda_pequena
	{
		display: none;
		position: absolute;
		width: 48px;
		height: 17px;
		background-image:url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
		background-position: -258px -10px;
		padding: 15px 0 0 10px;
		color: #FFF;
		z-index: 9000001;
	}
	
	.legenda_media
	{
		display: none;
		position: absolute;
		width: 82px;
		height: 17px;
		background-image:url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
		background-position: -163px -10px;
		padding: 15px 0 0 10px;
		color: #FFF;
		z-index: 9000002;
	}
	
	.legenda_grande
	{
		display: none;
		position: absolute;
		width: 144px;
		height: 17px;
		background-image:url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
		background-position: -10px -10px;
		padding: 15px 0 0 6px;
		color: #FFF;
		z-index: 9000003;
	}
	
	.menu_offprice
	{
		display: none;
		position: absolute;
		width: 84px;
		height: 30px;
		background-image:url(http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu_v2.gif);
		background-position: -554px -41px;
		text-indent: -9999px;
		top: 0;
		left: 50%;
		margin-left: 184px;
	}
	
		.menu_offprice:hover
		{
			background-position: -554px -72px;
		}
	
	.menu_novidades
	{
		display: none;
		position: absolute;
		width: 97px;
		height: 30px;
		background-image:url(http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu_v2.gif);
		background-position: -762px -41px;
		text-indent: -9999px;
		top: 0;
		left: 50%;
		margin-left: 268px;
	}
	
		.menu_novidades:hover
		{
			background-position: -762px -72px;
		}
		
	.menu_outroscanais
	{
		display: none;
		position: absolute;
		width: 131px;
		height: 30px;
		background-image:url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
		background-position: -859px -41px;
		text-indent: -9999px;
		top: 0;
		left: 50%;
		margin-left: 359px;
	}
	
		.menu_outroscanais:hover
		{
			background-position: -859px -72px;
		}
	
	#header
	{
		position: relative;
		width: 100%;
		height: 90px;
		border-bottom: #f2f2f2 solid 1px;
		z-index: 9000000;
	}
	
		#header #conteudo
		{
			position:relative;
			width: 980px;
			height:85px;
			top:0;
			left: 50%;
			margin-left:-490px;
		}
		
		#header #conteudo #logo
		{
			width: 142px;
			height: 54px;
			float: left;
			margin: 18px 0 0 15px;
			text-indent: -99999px;
		}
			
			#header #conteudo #logo a
			{
				width: 142px;
				height: 54px;
				display: block;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			}
		
		#header #conteudo #login
		{
			width: 170px;
			height: auto;
			float: left;
			margin: 18px 0 0 20px;
			padding: 15px 0 0 0;
		}
		
			#header #conteudo #login .cliente
			{
				font-weight:bold;
				color: #ee1d25;
			}
			
		#header #conteudo .logout
		{
			padding-top: 3px;
			display: inline;
			color: #bebebe;
		}
			
			#header #conteudo .logout a.teste
			{
				text-decoration: none;
				color: #bebebe;
			}
			
			#header #conteudo .logout a.teste:hover
			{
				text-decoration: underline;
			}
			
		#header #conteudo .div
		{
			width: 1px;
			height: 70px;
			float: right;
			margin: 5px 2px 0 2px;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -435px 0;
		}
		
		#header #conteudo a.busca:link, a.busca:visited, a.busca:active
		{
			width: 72px;
			height: 60px;
			float: right;
			margin: 10px 0 10px 0;
			display:none;
			text-decoration:none;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -362px -10px;
		}
		
			#header #conteudo a.busca:hover
			{
				background-position: -362px -95px;
			}
			
		#header #conteudo a.cadastro:link, a.cadastro:visited, a.cadastro:active
		{
			width: 72px;
			height: 60px;
			float: right;
			margin: 10px 0 10px 0;
			display:block;
			text-decoration:none;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -289px -10px;
		}
		
			#header #conteudo a.cadastro:hover
			{
				background-position: -289px -95px;
			}
		
		#header #conteudo a.atendimento:link, a.atendimento:visited, a.atendimento:active
		{
			width: 72px;
			height: 60px;
			float: right;
			margin: 10px 0 10px 0;
			display:block;
			text-decoration:none;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -216px -10px;
		}
		
			#header #conteudo a.atendimento:hover
			{
				background-position: -216px -95px;
			}
			
		#header #conteudo a.carrinho:link, a.carrinho:visited, a.carrinho:active
		{
			width: 70px;
			height: 34px;
			float: right;
			margin: 10px 0 10px 0;
			display:block;
			text-decoration:none;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -143px -10px;
			font-weight: bold;
			font-size: 12px;
			color: #FFF;
			text-align:center;
			padding: 26px 0 0 2px;
		}
		
			#header #conteudo a.carrinho:hover
			{
				background-position: -143px -95px;
			}
				
			#header #conteudo a.carrinho .itens
			{
				display:block;
				width:100%;
				font-weight: bold;
				font-size: 12px;
				color: #FFF;
				text-align:center;
				margin: 26px 0 0 2px;
			}
			
		#header #conteudo #busca
		{
			width: 372px;
			height: 24px;
			float: right;
			margin: 34px 18px 0 0;
			position: relative;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
			background-position: -143px -170px;
		}
			
			#header #conteudo #busca div.load
			{
				background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=loading_search.gif");
				display: block;
				height: 22px;
				left: 3px;
				position: absolute;
				text-indent: -9999px;
				top: 1px;
				width: 22px;
				z-index: 900;
			}
		
			#header #conteudo #busca input.fulltext-search-box
			{
				width: 270px;
				height: 15px;
				float: left;
				margin: 4px 0 0 25px;
				font-family: Arial, Helvetica, sans-serif;
				font-size: 13px;
				color: #9e9e9e;
				border: none;
			}
			
			#header #conteudo #busca input.botao
			{
				display: inline-block;
				width: 75px;
				height: 24px;
				float: right;
				margin: 0;
				text-indent: -99999px;
				background: #FFF;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: -437px 0px;
			}
			
			#header #conteudo #busca input.btn-buscar
			
			{
				background-color: #FFF;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: -437px 0px;
				border: none;
				cursor: pointer;
				float: right;
				height: 24px;
				text-indent: -99999px;
				width: 75px;
			}
			
			#header #conteudo #busca input.btn-buscar a.botao:link, 
			#header #conteudo #busca input.btn-buscar a.botao:visited, 
			#header #conteudo #busca input.btn-buscar a.botao:active
			{
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: -437px 0px;
				float: right;
				height: 24px;
				text-indent: -99999px;
				width: 75px;
			}
			
			#header #conteudo #busca a.botao:hover
			{
				background-position: -437px -25px;
			}
			
		#header #conteudo .hidden
		{
			display: none;
			float: right;
			width: 0px;
			height: 84px;
			overflow: hidden;
		}
			
		#header #conteudo #lista
		{
			width:400px;
		}
		
			#header #conteudo #lista ul
			{
				display: block;
				float: left;
				margin: 28px 17px 0 0;
				list-style-type:none;
			}
			
				#header #conteudo #lista li
				{
					margin: 0 0 5px 0;
				}
				
				#header #conteudo #lista li a:link, a:visited, a:active
				{
					text-decoration: none;
					color: #828282;
				}
				
				#header #conteudo #lista li a:hover
				{
					text-decoration: underline;
				}
				
				#header #conteudo #lista .hide
				{
					display: none;
				}
				
				#header #conteudo #lista .prefixo
				{
					font-size:9px;
				}
				
	.localize-lojas h3,
	.localize-lojas .brands
	{
		display: none;
	}
	
		.localize-lojas fieldset
		{
			clear: both;
		}
		
		.lojas span.titulo
		{
			display: block;
			float: left;
			width: 151px;
			height: 132px;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.jpg");
			background-position: -10px -10px;
			margin: 15px 0 7px 6px;
		}
		
		.localize-lojas .store-locator-cep-prefix
		{
			clear: both;
			display: block;
			float: left;
			margin: 0 5px 0 15px;
			width: 37px;
		}
		
		.localize-lojas .store-locator-cep-sufix
		{
			display: inline-block;
			float: left;
			margin-right: 10px;
			width: 23px;
		}
	
			.localize-lojas label.botao input:active
			{
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=botoes.gif");
				background-position: -414px -400px;
				cursor: pointer;
				height: 22px;
				text-indent: -99999px;
				width: 26px;
			}
			
		.localize-lojas .store-locator-cep-sufix
		{
			display: inline-block;
			float: left;
			margin-right: 10px;
			width: 23px;
		}
		
			.localize-lojas label.botao input
			{
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=botoes.gif");
				background-position: -414px -400px;
				border: none;
				cursor: pointer;
				height: 22px;
				text-indent: -99999px;
				width: 26px;
			}
		
		.localize-lojas a.nao-cep
		{
			display: block;
			float: left;
			width: 86px;
			height: 15px;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.jpg");
			background-position: -17px -143px;
			text-decoration: none;
			text-indent: -9999px;
			margin: 5px 0 10px 13px;
		}
				
			.localize-lojas a.nao-cep:hover
			{
				background-position: -17px -159px;
			}
				
	#tags
	{
		border: solid 1px #f2f2f2;
		clear: both;
		display: block;
		height: auto;
		left: 50%;
		margin: 40px 0 0 -483px;
		position: relative;
		width: 980px;
	}
	
		#tags .info
		{
			background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif") no-repeat 0 -108px;
			cursor: default;
			display: inline-block;
			height: 52px;
			left: 20px;
			position: absolute;
			text-indent: -9999px;
			top: 20px;
			width: 63px;
		}
		
		#tags .links
		{
			display: inline-block;
			font-size: 14px;
			line-height: 20px;
			margin: 18px 15px 18px 120px;
			width: 840px;
		}
		
		#tags .links a
		{
			display: inline-block;
			padding: 0 5px 0 5px;
			text-decoration: none;
			color: #7f7f7f;
		}
		
			#tags .links a:hover { color: #ff0000; }
			
			#tags .links abusca16 { font-size: 9px }
			
			#tags .links abusca18 { font-size: 12px }
			
			#tags .links abusca20 { font-size: 14px }
			
	#footer
	{
		clear: both;
		display: block;
		margin: 40px 0 0 0;
		width: 100%;
		height: 148px;
	}
	
		#footer #conteudo
		{
			position: relative;
			width: 980px;
			height: 148px;
			top: 0;
			left: 50%;
			margin-left: -490px;
		}
		
			#footer #conteudo .linha
			{
				display: block;
				width: 980px;
				height: 1px;
				background-color: #e6e6e6;
			}
			
			#footer #conteudo .fundo
			{
				display: block;
				width: 980px;
				height: 150px;
				background-color: #f2f2f2;
				background-position: 0px -197px;
			}
			
			#footer #conteudo #pagamento
			{
				display: block;
				float: left;
				width: 250px;
				height: 130px;
				font-size: 10px;
				padding: 20px 0 0 30px;
				line-height: 12px;
			}
			
				#footer #conteudo #pagamento a
				{
					font-size: 10px;
					color: #828282;
					text-decoration: none;
				}
				
				#footer #conteudo #pagamento a:hover
				{
					text-decoration: underline;
				}
		
				#footer #conteudo #pagamento font.titulo
				{
					line-height: 22px;
					color: #4e4e4e;
					font-weight: bold;
				}
				
				#footer #conteudo #pagamento .bandeiras
				{
					margin: 5px 0 0 0;
				}
				
				#footer #conteudo #pagamento span
				{
					display: block;
					float: left;
					height: 26px;
					margin: 5px 10px 0 0;
					background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				}
				
					#footer #conteudo #pagamento span.visa
					{
						width: 40px;
						background-position: 0px -55px;
					}
					
					#footer #conteudo #pagamento span.mastercard
					{
						width: 38px;
						background-position: -41px -55px;
					}
					
					#footer #conteudo #pagamento span.amex
					{
						width: 28px;
						background-position: -80px -55px;
					}
					
					#footer #conteudo #pagamento span.diners
					{
						width: 38px;
						background-position: -73px -82px;
					}
					
					#footer #conteudo #pagamento span.hipercard
					{
						width: 39px;
						background-position: -0px -109px;
					}
					
					#footer #conteudo #pagamento span.oipaggo
					{
						width: 72px;
						margin: 5px 7px 0 0px;
						background-position: -0px -82px;
					}
					
					#footer #conteudo #pagamento span.itau
					{
						width: 24px;
						margin: 5px 15px 0 0;
						background-position: -109px -55px;
					}
					
					#footer #conteudo #pagamento span.boleto
					{
						width: 30px;
						background-position: -40px -109px;
					}
										
					#footer #conteudo #pagamento span.aura
					{
						width: 30px;
						background-position: -112px -82px;
					}
															
					#footer #conteudo #pagamento span.banrisul
					{
						width: 35px;
						margin: 5px 10px 0 -7px;
						background-position: -711px -153px;
					}
				
			#footer #conteudo #linhaBranca
			{
				display: block;
				float: left;
				width: 1px;
				height: 145px;
				font-size: 10px;
				margin-top:10px;
				line-height: 12px;
				background-color:#FFF;
			}
			
			#footer #conteudo #linhaCinza
			{
				display: block;
				float: left;
				width: 1px;
				height: 145px;
				font-size: 10px;
				margin-top:10px;
				line-height: 12px;
				background-color:#e2e2e2;
			}
			
			#footer #conteudo #institucional
			{
				display: block;
				float: left;
				width: 670px;
				height: 130px;
				font-size: 10px;
				padding: 20px 0 0 25px;
				line-height: 12px;
			}
			
				#footer #conteudo #institucional a
				{
					font-size: 10px;
					color: #828282;
					text-decoration: none;
				}
				
				#footer #conteudo #institucional a:hover
				{
					text-decoration: underline;
				}
		
				#footer #conteudo #institucional font.titulo
				{
					line-height: 22px;
					color: #4e4e4e;
					font-weight: bold;
				}
				
				#footer #conteudo #institucional font.tituloB
				{
					line-height: 22px;
					color: #4e4e4e;
					font-weight: bold;
					display:block;
					margin: 30px 0 -5px 0;
					clear:both;
				}
				
				#footer #conteudo #institucional ul
				{
					display: inline;
					list-style-type: none;
				}
				
					#footer #conteudo #institucional ul li
					{
						float: left;
					}
					
					#footer #conteudo #institucional ul li.div
					{
						padding: 0 5px 0 5px;
						color:#CCC;
					}
					
				#footer #conteudo #institucional .certificados
				{
					margin: 5px 0 0 0;
				}
				
				#footer #conteudo #institucional span
				{
					background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat;
					display: block;
					float: left;
					height: 26px;
					margin: 5px 25px 0 0;
				}
				
					#footer #conteudo #institucional span.certisign
					{
						background-position: 0px -136px;
						height: 28px;
						width: 83px;
					}
					
					#footer #conteudo #institucional span.ebit
					{
						background-position: -791px -153px;
						width: 69px;
					}
					
					#footer #conteudo #institucional span.buscape
					{
						background-position: 0px -165px;
						width: 132px;
					}
					
					#footer #conteudo #institucional span.blindado
					{
						background: none;
						height: 29px;
						width: 115px;
					}
					
				#footer #conteudo #institucional a.certisign
				{
					background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat 0px -136px;
					display: block;
					float: left;
					height: 28px;
					margin: 5px 25px 0 0;
					text-indent: -9999px;
					width: 83px;
				}
				
				#footer #conteudo #institucional a.vtex
				{
					background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat -632px -153px;
					display: block;
					float: left;
					height: 26px;
					margin: 5px 50px 0 0;
					text-indent: -9999px;
					width: 78px;
				}
		
			#footer #conteudo .curva
			{
				display: block;
				width: 980px;
				height: 13px;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: 0px -197px;
			}	
			
			#footer #conteudo .copyright
			{
				float: left;
				display:block;
				margin: 23px 15px 0 320px;
				color:#cacaca;
				font-size:9px;
				height: 40px;
			}
			
			#footer #conteudo .paises
			{
				float:left;
				display:block;
				width: 57px;
				height: 24px;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: -603px -94px;
				margin-top: 15px;
			}
			
				#footer #conteudo .paises .brasil
				{
					float:left;
					display:block;
					width: 25px;
					height: 18px;
					background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
					background-position: -84px -136px;
					margin: 3px 0 0 20px;
				}
				
				#footer #conteudo .paises .argentina
				{
					float:left;
					display:none;
					width: 25px;
					height: 18px;
					background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
					background-position: -110px -136px;
					margin: 3px 0 0 14px;
				}
				
	#menu,
	.menuwrap
	{
		position: relative;
		width: 100%;
		height: 30px;
		z-index: 9000009;
	}
	
		#menu ul,
		.menuwrap ul
		{
			display: block;
			position: relative;
			width: 980px;
			height: 30px;
			list-style: none;
			top: 0;
			left: 50%;
			margin: 12px 0 0 -490px;
			background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
			background-position: -10px -10px;
		}
		
			#menu ul li,
			.menuwrap ul li
			{
				position: absolute;
				display: inline-block;
				float: left;
			}
			
			#menu ul li a,
			.menuwrap ul li a
			{
				display: block;
				height: 30px;
				text-indent: -9999px;
				padding: 0;
				background-image: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
				background-position: -10px -10px;
			}
			
			#menu ul li.menu-beleza-e-saude,
			.menuwrap ul li.menu-beleza-e-saude { left: 0; }
			
			#menu ul li.menu-beleza-e-saude a,
			.menuwrap  ul li.menu-beleza-e-saude a
			{
				background-position: -10px -41px;
				width: 136px;
			}
			
				#menu ul li.menu-beleza-e-saude a:hover,
				.menuwrap ul li.menu-beleza-e-saude a:hover { background-position: -10px -72px; }
				
			#menu ul li.menu-casa,
			.menuwrap ul li.menu-casa { left: 136px; }
			
			#menu ul li.menu-casa a,
			.menuwrap ul li.menu-casa a
			{
				background-position: -146px -41px;
				width: 63px;
			}
			
				#menu ul li.menu-casa a:hover,
				.menuwrap ul li.menu-casa a:hover{ background-position: -146px -72px; }
				
			#menu ul li.menu-cozinha,
			.menuwrap ul li.menu-cozinha { left: 199px; }
			
			#menu ul li.menu-cozinha a,
			.menuwrap ul li.menu-cozinha a
			{
				background-position: -209px -41px;
				width: 84px;
			}
			
				#menu ul li.menu-cozinha a:hover,
				.menuwrap ul li.menu-cozinha a:hover { background-position: -209px -72px; }
				
			#menu ul li.menu-eletronicos,
			.menuwrap ul li.menu-eletronicos { left: 283px; }
			
			#menu ul li.menu-eletronicos a,
			.menuwrap ul li.menu-eletronicos a 
			{
				background-position: -293px -41px;
				width: 117px;
			}
			
				#menu ul li.menu-eletronicos a:hover,
				.menuwrap ul li.menu-eletronicos a:hover { background-position: -293px -72px; }
				
			#menu ul li.menu-esporte-e-lazer,
			.menuwrap ul li.menu-esporte-e-lazer { left: 530px; }
			
			#menu ul li.menu-esporte-e-lazer a,
			.menuwrap ul li.menu-esporte-e-lazer a
			{
				background-position: -410px -41px;
				width: 144px;
			}
			
				#menu ul li.menu-esporte-e-lazer a:hover,
				.menuwrap ul li.menu-esporte-e-lazer a:hover { background-position: -410px -72px; }
				
			#menu ul li.menu-livros,
			.menuwrap ul li.menu-livros { display:none; left: 674px; }
			
			#menu ul li.menu-livros a,
			.menuwrap ul li.menu-livros a
			{
				background-position: -554px -41px;
				width: 73px;
			}
			
				#menu ul li.menu-livros a:hover,
				.menuwrap ul li.menu-livros a:hover { background-position: -554px -72px; }
			
			#menu ul li.menu-informatica,
			.menuwrap ul li.menu-informatica { left: 400px; }
			
			#menu ul li.menu-informatica a,
			.menuwrap ul li.menu-informatica a
			{
				background-position: -627px -41px;
				width: 130px;
			}
			
				#menu ul li.menu-informatica a:hover,
				.menuwrap ul li.menu-informatica a:hover { background-position: -627px -72px; }
				
			#menu ul li.menu-musica-e-video,
			.menuwrap ul li.menu-musica-e-video
			{
				display: none;
			}
			
			/*
			
			#menu ul li.menu-musica-e-video,
			.menuwrap ul li.menu-musica-e-video { left: 617px; }
			
			#menu ul li.menu-musica-e-video a,
			.menuwrap ul li.menu-musica-e-video a
			{
				background-position: -627px -41px;
				width: 130px;
			}
			
				#menu ul li.menu-musica-e-video a:hover,
				.menuwrap ul li.menu-musica-e-video a:hover { background-position: -627px -72px; }
				
			*/
			
		#dropmenu
		{
			background-color: #fff;
			border-left: solid 1px #4e4e4e;
			border-right: solid 1px #4e4e4e;
			border-bottom: solid 1px #4e4e4e;
			display: none;
			height: 150px;
			left: 50%;
			margin-left: -487px;
			position: absolute;
			top: 30px;
			width: 972px;
			-moz-border-radius-bottomleft: 20px;
			-moz-border-radius-bottomright: 20px;
			-webkit-border-bottom-left-radius: 20px;
			-webkit-border-bottom-right-radius: 20px;
			-moz-box-shadow: 0 5px 10px rgba( 0, 0, 0, .3 );
			-webkit-box-shadow: 0 5px 10px rgba( 0, 0, 0, .3 );
		}
		
		#dropmenu span
		{
			display: inline;
			float: left;
		}
		
		#dropmenu span a
		{
			clear: both;
			color: #4d4d4d;
			display: block;
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			font-size: 12px;
			font-weight: bold;
			margin: 0;
			padding: 15px 0 5px 15px;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
		}
		
		#dropmenu span a:hover
		{
			color: #ed1d24;
		}
		
		#dropmenu span a img
		{
			display: block;
			height: 90px;
			margin-bottom: 5px;
			width: 140px;
		}
		
		#dropmenu span.twitter
		{
			float: right;
			margin: 50px 30px 0 0;
			width: 200px;
		}
		
		#dropmenu span.twitter a span.image
		{
			display: inline-block;
			background: url("http://www.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif") no-repeat -820px -67px;
			float: right;
			height: 20px;
			margin: -6px 0 0 5px;
			text-indent: -9999px;
			width: 85px;
		}