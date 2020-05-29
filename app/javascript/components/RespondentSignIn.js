import React from "react"
import PropTypes from "prop-types"
class RespondentSignIn extends React.Component {
  constructor(props) {
    super(props)
    this.state = {phone: "", code: "", showPhoneForm: true, showCodeForm: false};

    this.handleChangePhone = this.handleChangePhone.bind(this);
    this.handleSubmitPhone = this.handleSubmitPhone.bind(this);
    this.handleChangeCode = this.handleChangeCode.bind(this);
    this.handleSubmitCode = this.handleSubmitCode.bind(this);
  };

  handleChangePhone(event) {
    this.setState({phone: event.target.value})
  }


  handleChangeCode(event) {
    this.setState({code: event.target.value})
  }

  handleSubmitPhone(event) {
    event.preventDefault();

    fetch("/api/v1/session", {
      method: "POST",
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({"respondent": {"phone": this.state.phone} })
    })
      .then(response => { if (response.ok) { this.setState({showPhoneForm: false, showCodeForm: true}) }})
  }

  handleSubmitCode(event) {
    event.preventDefault();

    fetch("/api/v1/session", {
      method: "POST",
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({"respondent": {"phone": this.state.phone, "sms_code": this.state.code}})
    })
      .then(response => { if (response.ok) {window.location.href = "/respondent"}})
  }

  render() {
    return (
      <React.Fragment>
        <h1> Вход для респондента </h1>
      { this.state.showPhoneForm && (<form onSubmit={this.handleSubmitPhone}>
          <label>
            Телефон
            <input type="text" value={this.state.phone} onChange={this.handleChangePhone} />
          </label>
          <input type="submit" value="Отправить" />
        </form>)
      }

       {this.state.showCodeForm && (<form onSubmit={this.handleSubmitCode}>
          <label>
            Код
            <input type="text" value={this.state.code} onChange={this.handleChangeCode} />
          </label>
          <input type="submit" value="Отправить" />
        </form>)
       }
      </React.Fragment>
    )
  };
}

export default RespondentSignIn
