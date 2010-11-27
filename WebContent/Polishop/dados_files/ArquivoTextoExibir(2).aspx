
/* POLISHOP : BASE ALTERNATIVA (para as paginas engessadas) */
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
	
	hr,
	h1,
	a#checkout-chat,
	div#login,
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
	
		div.welcome strong
		{
			font-weight: normal;
		}
	
		div.welcome em
		{
			padding-top: 3px;
			clear: both;
			color: #bebebe;
			display: block;
			font-style: normal;
		}
			
			div.welcome em a
			{
				text-decoration: none;
				color: #bebebe;
			}
			
			div.welcome em a:hover
			{
				text-decoration: underline;
			}
		
		div.welcome span#lblLoginMsg
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
			background-image:url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
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
	
	#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono
	{
		position: relative;
		left: 50%;
	}
	
	#ctl00_TopBar_TopBar1_pnlTopBarAssincrono, 
	#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono
	{
		display: block;
		width: 150px;
		position: absolute;
		padding: 0;
		margin: 35px 0 0 -318px;
		z-index: 9000004;
	}
	
		#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg,
		#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono p.loginmsg
		{
			padding-top: 3px;
			color: #bebebe;
			display: inline-block;
			font-style: normal;
			margin-left: 92px;
		}
		
			#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg em,
			#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono p.loginmsg em
			{
				font-style: normal;
			}
		
		#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg a#lnkLogin,
		#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono p.loginmsg a#lnkLogin
		{
			font-style: normal;
			color: #bebebe;
			margin-left: -106px;
		}
		
			#ctl00_TopBar_TopBar1_pnlTopBarAssincrono p.loginmsg a#lnkLogin:hover,
			#ctl00_TopBar_ComercioTopBar_pnlTopBarAssincrono p.loginmsg a#lnkLogin:hover
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
		background-image:url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
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
		background-image:url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
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
		background-image:url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.png");
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
		background-image:url(https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu_v2.gif);
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
		background-image:url(https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu_v2.gif);
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
		background-image:url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
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
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			display: block;
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat -143px -170px;
			float: right;
			height: 24px;
			margin: 34px 18px 0 0;
			position: relative;
			width: 372px;
		}
		
			#header #conteudo #busca select { display: none; }
		
			#header #conteudo #busca input.campoBusca
			{
				background: transparent;
				border: none;
				color: #9e9e9e;
				font-family: Arial, Helvetica, sans-serif;
				font-size: 13px;
				height: 15px;
				width: 260px;
				left: 24px;
				position: absolute;
				top: 4px;
			}
			
			#header #conteudo #busca input.botao
			{
				background: #fff url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat -437px 0px;
				border: none;
				cursor: pointer;
				height: 24px;
				line-height: 200px;
				text-indent: -99999px;
				position: absolute;
				right: 0;
				top: 0;
				width: 75px;
			}
			
				#header #conteudo #busca input[type=button] hover { background-position: -437px -25px; }
			
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
				
	.header-steps
	{
		border-bottom: #f2f2f2 solid 1px;
		height: 90px;
		margin-bottom: -100px;
		position: relative;
		width: 100%;
		z-index: 9000000;
	}
	
		.header-steps .steps
		{
			height:85px;
			left: 50%;
			margin-left:-490px;
			position:relative;
			top:0;
			width: 980px;
		}
	
		.header-steps h1
		{
			display: block;
			float: left;
			height: 54px;
			margin: 0;
			text-indent: -9999px;
			width: 142px;
		}
			
			.header-steps h1 a
			{
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				display: block;
				height: 54px;
				width: 142px;
			}
		
		.header-steps .steps #logo
		{
			width: 142px;
			height: 54px;
			float: left;
			margin: 20px 0 0 30px;
			text-indent: -9999px;
		}
		
		.header-steps .steps ul
		{
			display: block;
			float: right;
			margin: 7px 300px 0 0;
		}
		
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liIdentificacao,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liIdentificacao,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liEntregaEmbalagem,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liEntregaEmbalagem,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liPagamento,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liPagamento,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liConfirmacao,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liConfirmacao
			{
				display: none;
				text-indent: -9999px;
			}
		
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liIdentificacao.ativo,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liIdentificacao.ativo,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liEntregaEmbalagem.ativo,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liEntregaEmbalagem.ativo,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liPagamento.ativo,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liPagamento.ativo,
			.header-steps .steps ul li#ctl00_TopBar_TopBar1_liConfirmacao.ativo,
			.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liConfirmacao.ativo
			{
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=checkout.gif");
				display: inline-block;
				float: right;
				height: 54px;
				width: 430px;
			}
			
				.header-steps .steps ul li#ctl00_TopBar_TopBar1_liIdentificacao.ativo,
				.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liIdentificacao.ativo { background-position: -10px -10px; }
				
				.header-steps .steps ul li#ctl00_TopBar_TopBar1_liEntregaEmbalagem.ativo,
				.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liEntregaEmbalagem.ativo { background-position: -10px -65px; }
				
				.header-steps .steps ul li#ctl00_TopBar_TopBar1_liPagamento.ativo,
				.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liPagamento.ativo { background-position: -10px -120px; }
				
				.header-steps .steps ul li#ctl00_TopBar_TopBar1_liConfirmacao.ativo,
				.header-steps .steps ul li#ctl00_TopBar_ComercioTopBar_liConfirmacao.ativo { background-position: -10px -175px; }
				
				.header-steps .steps ul li#ctl00_TopBar_TopBar1_liConfirmacao .ULTIMO { background-position: -522px -403px; }
				
			.header-steps .steps a#checkout-chat
			{
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=checkout.gif");
				background-position: -592px -459px;
				display: block;
				height: 55px;
				position: absolute;
				right: 20px;
				text-indent: -9999px;
				top: 24px;
				width: 230px;
			}
			
				.header-steps .steps a#checkout-chat:hover { background-position: -592px -515px; }
	
	#tags
	{
		display: block;
		clear: both;
		border: solid 1px #f2f2f2;
		position: relative;
		width: 980px;
		left: 50%;
		margin: 40px 0 0 -483px;
	}
	
		#tags .info
		{
			display: inline-block;
			width: 63px;
			height: 74px;
			text-indent: -9999px;
			margin: 20px;
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif");
			background-position: 0 -108px;
		}
		
			#tags .info:hover { background-position: 0 -183px; }
		
		#tags .links
		{
			display: inline-block;
			float: right;
			width: 800px;
			margin: 15px;
			font-size: 14px;
			line-height: 20px;
		}
		
		#tags .links a
		{
			display: inline-block;
			padding: 0 5px 0 5px;
			text-decoration: none;
			color: #7f7f7f;
		}
		
			#tags .links a:hover { color: #ff0000; }
			
	#footer
	{
		clear: both;
		display: block;
		float: left;
		margin: 0;
		padding: 0;
		position: relative;
		height: 148px;
		width: 100%;
	}
	
		#footer #conteudo
		{
			height: 148px;
			left: 50%;
			margin-left: -490px;
			position: relative;
			top: 0;
			width: 980px;
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
					background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
					background: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat;
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
					background: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat 0px -136px;
					display: block;
					float: left;
					height: 28px;
					margin: 5px 25px 0 0;
					text-indent: -9999px;
					width: 83px;
				}
				
				#footer #conteudo #institucional a.vtex
				{
					background: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif") no-repeat -632px -153px;
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
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
				background-position: -603px -94px;
				margin-top: 15px;
			}
			
				#footer #conteudo .paises .brasil
				{
					float:left;
					display:block;
					width: 25px;
					height: 18px;
					background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
					background-position: -84px -136px;
					margin: 3px 0 0 20px;
				}
				
				#footer #conteudo .paises .argentina
				{
					float:left;
					display:none;
					width: 25px;
					height: 18px;
					background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=base.gif");
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
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
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
				background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=menu.gif");
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
			background: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif") no-repeat -820px -67px;
			float: right;
			height: 20px;
			margin: -6px 0 0 5px;
			text-indent: -9999px;
			width: 85px;
		}
				
	#letreiro
	{
		display:block;
		clear: both;
		position: relative;
		width: 980px;
		height: 27px;
		left: 50%;
		padding: 0 0 0 0;
		margin: 25px 0 0 -489px;
		text-align: center;		
		color: #3d3d3d;
		font-size:14px;
		background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif");
		background-position: 0 -339px;
	}
	
		#letreiro a.home
		{
			display: inline-block;
			float: left;
			width: 33px;
			height: 27px;
			text-indent: -9999px;
			margin: 0;
			padding: 0;
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif");
			background-position: -128px -311px;
		}
		
		#letreiro a.link
		{
			display: inline-block;
			float: left;
			margin: 9px 12px 0 12px;
			text-transform: uppercase;
			text-decoration: none;
			font-size: 12px;
			font-weight:bold;
			color: #717171;
		}
		
		#letreiro div.insert h2
		{
			display: inline-block;
			float: left;
			margin: 9px 12px 0 12px;
			text-transform: uppercase;
			text-decoration: none;
			font-size: 12px;
			font-weight:bold;
			color: #717171;
		}
		
		#letreiro div.insert h2 a
		{
			color: #717171;
			text-decoration: none;
		}
		
		#letreiro span
		{
			display: inline-block;
			float: left;
			width: 15px;
			height: 27px;
			text-indent: -9999px;
			margin: 0;
			padding: 0;
			background-image: url("https://www2.polishop.com.br/Control/ArquivoExibir.aspx?NomeArquivo=home.gif");
			background-position: -163px -311px;
		}
		
		#letreiro font
		{
			display: block;
			padding: 7px;
		}