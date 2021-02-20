const initSendMessage = () => {
  const input = document.getElementById('input_message');
  if (input) {
    input.addEventListener('keypress', event => {
      if (event.key === 'Enter') {
        const button = document.querySelector('.submit-button');
        button.click();
      };
    });
  };
};

export { initSendMessage };
