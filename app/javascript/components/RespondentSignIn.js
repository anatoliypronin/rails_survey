import React from "react"
import PropTypes from "prop-types"
class RespondentSignIn extends React.Component {
  constructor(props) {
    super(props)
    this.state = {phone: ""}
  };

  handleChangePhone(event){
    this.setState({phone: event.target.value})
  }

  handleSubmitPhone(event) {
    alert("Телефон: " + this.state.phone);
  }

  render() {
    return (
      <React.Fragment>
        <h1> Вход для респондента </h1>
        <form onSubmit={this.handleSubmitPhone}>
        <label>
          Телефон
          <input type="text" value={this.state.phone} onChange={this.handleChangePhone} />
        </label>

      </React.Fragment>
    )
  };
}

export default RespondentSignIn
