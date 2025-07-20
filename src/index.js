const { app, BrowserWindow } = require('electron');
const path = require('node:path');
const net = require("net");


const pinStates = {
  1: false,
  2: false, //Fan One; Pin Three
  3: false, //Fan Two; Pin Five
  4: false, //Matrix One; Pin Seven
  5: false,
  6: false,
  7: false,
  8: false,
  9: false,
  10: false,
  11: false,
  12: false,
  13: false,
  14: false, //Matrix Two; Pin Eight
  15: false, //LEDS; Pin Ten
  16: false,
  17: false,
  18: false,
  19: false,
  20: false,
  21: false,
  22: false,
  23: false,
  24: false,
  25: false,
  26: false,
  27: false,
  28: false,
};




// Handle creating/removing shortcuts on Windows when installing/uninstalling.
if (require('electron-squirrel-startup')) {
  app.quit();
}
if (process.env.NODE_ENV !== 'production') {
  try {
    require('electron-reload')(__dirname, {
      electron: require('electron')
    });
  } catch (e) {
    console.warn('electron-reload not loaded (dev only).');
  }
}

const createWindow = () => {
  const mainWindow = new BrowserWindow({
    fullscreen: true,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
    },
    frame: false,
  });

  mainWindow.setMenuBarVisibility(false);
  mainWindow.removeMenu();

  mainWindow.loadFile(path.join(__dirname, 'index.html'));
};

//Sending GPIO Commands
function sendGpioCommand(command) {
  return new Promise((resolve, reject) => {
    const client = new net.Socket();
    client.connect(65432, "127.0.0.1", () => {
      client.write(JSON.stringify(command));
    });

    client.on("data", (data) => {
      try {
        const response = JSON.parse(data.toString());
        if (response.status === "ok") {
          // Update pin state if action was a write or read
          if (command.action === "write") {
            pinStates[command.pin] = command.value;
          } else if (command.action === "read" && "value" in response) {
            pinStates[command.pin] = response.value;
          }
        }
        resolve(response);
      } catch (err) {
        reject("Invalid JSON from Python");
      }
      client.destroy();
    });

    client.on("error", reject);
  });
}

function handleButtonClick(buttonFanOne){
  togglePin(2);
}
function handleButtonClick(buttonFanOne){
  togglePin(3);
}
function handleButtonClick(buttonFanOne){
  togglePin(4);
}
function handleButtonClick(buttonFanOne){
  togglePin(14);
}
function handleButtonClick(buttonFanOne){
  togglePin(15);
}



async function togglePin(pinNumber) {
  // 1. Read the current state
  const readResponse = await sendGpioCommand({
    action: "read",
    pin: pinNumber
  });

  if (readResponse.status !== "ok") {
    console.error(`Failed to read pin ${pinNumber}:`, readResponse.message);
    return;
  }

  // 2. Get the current value (true/false)
  const currentState = readResponse.value;

  // 3. Calculate new state (invert it)
  const newState = !currentState;

  // 4. Write the new state to the pin
  const writeResponse = await sendGpioCommand({
    action: "write",
    pin: pinNumber,
    value: newState
  });

  if (writeResponse.status === "ok") {
    console.log(`Pin ${pinNumber} toggled to ${newState ? "ON" : "OFF"}`);
    pinStates[pinNumber] = newState; // optional: update your local state map
  } else {
    console.error(`Failed to write pin ${pinNumber}:`, writeResponse.message);
  }
}



app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
      led.writeSync(0);
      ed.unexport();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});