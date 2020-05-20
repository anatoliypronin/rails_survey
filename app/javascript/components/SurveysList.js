import React from "react"
import PropTypes from "prop-types"
import AddPopup from './AddPopup';
class SurveysList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      surveys: [],
    }
  };
  fetchSurvey() {
    return fetch(Routes.api_v1_surveys_path({format: 'json'}))
      .then(response => response.json())
      .then(result => this.setState({surveys: result}))
      
  }
  
  componentDidMount() {
    this.fetchSurvey();
  }

  getTags(tags){
    let result = [];
    for (let tag of tags) {
      result.push(tag.title);

    }
    return (
      result
    );
  }

  linkSurvey(survey){
    window.open(Routes.admin_survey_path(survey.id), '_blank');
  }

  surveys(){
    let table = [];
    const surveys = this.state.surveys;
    for (let survey of surveys) {
    table.push(
      <tr key={survey.id} onClick={() => this.linkSurvey(survey)}>
        <td>{survey.title}</td>
        <td>{this.getTags(survey.tags)}</td>
      </tr>
    );

    }
    return (
      table
    );
  }

  render () {
    return (
      <React.Fragment>
      <div className='d-flex align-items-center p-3 my-3 rounded box-shadow'>
        <h2>Публичные опросы</h2>
      </div>
      <table className='table table-hover table-dark table-striped'>
        <thead>
          <tr>
            <th>Name</th>
            <th>Tags</th>
          </tr>
        </thead>
        <tbody>
          {this.surveys()}
        </tbody>
      </table>
      <AddPopup
        show = {this.state.addPopupShow}
        onClose={this.handleAddClose}
      />
      </React.Fragment>
    );
  }
}

export default SurveysList
