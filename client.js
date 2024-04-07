const API_BASE_URL = "http://127.0.0.1:3000/api/";

exports.getPatients = function getPatients() {
  const f = async () => {
    try {
      const response = await fetch(API_BASE_URL + "/patients/");
      if (response.ok) {
        const body = await response.json();

        return body.data;
      } else {
        return [];
      }
    } catch (err) {
      console.warn(err);
      return [];
    }
  };
  const result = f().catch(console.warn);
  return result;
};

exports.getPatient = async function getPatient(id) {
  try {
    const response = await fetch(API_BASE_URL + "/patients/" + id.toString());
    if (response.ok) {
      const body = await response.json();

      return body.data;
    } else {
      return null;
    }
  } catch (err) {
    console.warn(err);
    return null;
  }
};

exports.createPatient = async function createPatient(name, lastname, dni, birthDate) {
  try {
    const params = {
      name,
      lastname,
      dni,
      birth_date: birthDate,
    };

    const response = await fetch(API_BASE_URL + "/patients", {
      method: "POST",
      body: JSON.stringify(params),
      headers: {
        "content-type": "application/json"
      }
    }) 
    const body = await response.json();
    if (response.ok) {

      return body.data;
    } else {
      return body.errors;
    }
  } catch (err) {
    console.warn(err);
    return null;
  }
};
