const WHATSAPP = "5574998062818";
    const CHAVE_PIX = "71996131117";
    let aparelhoEscolhido = "";

    // Toca música ao primeiro clique
    document.addEventListener('click', function tocarSom() {
      const som = document.getElementById('musica');
      som.volume = 0.5;
      som.play().catch(()=>{});
      document.removeEventListener('click', tocarSom);
    });

    function notify(texto) {
      const aviso = document.getElementById("toast");
      aviso.textContent = texto;
      aviso.classList.add("mostrar");
      setTimeout(() => aviso.classList.remove("mostrar"), 3000);
    }

    function scrollToSection(id) {
      document.getElementById(id).scrollIntoView({behavior: "smooth"});
    }

    function abrirListaAparelhos() {
      document.getElementById("lista-aparelhos").classList.add("ativo");
      notify("📱 Escolhe o teu celular!");
    }

    function verificarAparelho() {
      const valor = document.getElementById("aparelho").value;
      if (!valor) return;
      aparelhoEscolhido = valor;
      document.getElementById("redes-area").classList.add("ativo");
      notify(`✅ ${valor} escolhido! Segue as redes abaixo!`);
    }

    function liberarZap() {
      if (!aparelhoEscolhido) {
        notify("⚠️ Escolha o aparelho primeiro!");
        return;
      }
      document.getElementById("redes-area").style.display = "none";
      document.getElementById("btn-zap-final").classList.add("ativo");
      notify("✅ Pronto! Clica no botão verde!");
    }

    function abrirWhatsAppFinal() {
      if (!aparelhoEscolhido) return;
      const mensagem = encodeURIComponent(
        "Olá NEGO TTK! Já segui todas as redes! ✅\n\n" +
        "Quero a sensibilidade grátis para: " + aparelhoEscolhido + "\n\n" +
        "Aguardo! Obrigado! 🙌🔥"
      );
      window.open("https://wa.me/" + WHATSAPP + "?text=" + mensagem, "_blank");
      notify("💚 Abrindo WhatsApp...");
    }

    function enviarPedido(nome, valor) {
      const mensagem = encodeURIComponent(
        "✅ PEDIDO — NEGO TTK 🔥\n\n" +
        "Produto: " + nome + "\n" +
        "Valor: R$ " + valor.toFixed(2).replace(".", ",") + "\n" +
        "Chave PIX: " + CHAVE_PIX + "\n\n" +
        "Já fiz o pagamento! Aqui está o comprovante 👇"
      );
      window.open("https://wa.me/" + WHATSAPP + "?text=" + mensagem, "_blank");
      notify("💚 Abrindo WhatsApp...");
    }

    function abrirZap(texto) {
      const mensagem = encodeURIComponent("Olá! " + texto + " 🙌");
      window.open("https://wa.me/" + WHATSAPP + "?text=" + mensagem, "_blank");
      notify("💚 Abrindo WhatsApp...");
    }