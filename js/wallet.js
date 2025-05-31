document.addEventListener("DOMContentLoaded", () => {
    const walletBtn = document.querySelector(".wallet-btn");
  
    if (!window.ethereum) {
      walletBtn.innerText = "Cüzdan Bulunamadı";
      walletBtn.disabled = true;
      return;
    }
  
    walletBtn.addEventListener("click", async () => {
      try {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        const signer = provider.getSigner();
        const address = await signer.getAddress();
  
        walletBtn.innerText = "🔗 " + address.slice(0, 6) + "..." + address.slice(-4);
        walletBtn.classList.add("connected");
  
      } catch (error) {
        console.error("Cüzdan bağlantısı başarısız:", error);
        alert("Cüzdan bağlanamadı.");
      }
    });
  });
  