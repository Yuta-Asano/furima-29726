const pay = () => {
  Payjp.setPublicKey("pk_test_8d27629191678f9301bbcc62");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address_credit[number]"),
      cvc: formData.get("address_credit[cvc]"),
      exp_month: formData.get("address_credit[exp_month]"),
      exp_year: `20${formData.get("address_credit[exp_year]")}`, 
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> ` ;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
       document.getElementById("card-number").removeAttribute("name");
       document.getElementById("card-cvc").removeAttribute("name");
       document.getElementById("card-exp-month").removeAttribute("name");
       document.getElementById("card-exp-year").removeAttribute("name")

       document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);