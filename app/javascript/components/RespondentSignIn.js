import React from "react"
import PropTypes from "prop-types"
class RespondentSignIn extends React.Component {
  constructor(props) {
    super(props)
    this.state = {phone: ""}
  };

  render() {
    return (
      <React.Fragment>
        <h1> Вход для респондента </h1>
        <label>
          Телефон
          <input type="text" value={this.state.phone}
        </label>

      </React.Fragment>
    )
  };
}

export default RespondentSignIn
