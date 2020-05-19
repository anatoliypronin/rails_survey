import React from "react"
import PropTypes from "prop-types"
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

  surveys(){
    let table = [];
    const surveys = this.state.surveys;
    for (let survey of surveys) {
    table.push(<tr><td>{survey.title}</td><td>{this.getTags(survey.tags)}</td><a className="btn btn-info" href={Routes.admin_survey_path(survey.id)}>Перейти</a></tr>);

    }
    return (
      table
    );
  }

  render () {
    return (
      <React.Fragment>
      <h2>Публичные опросы</h2>
      <table className='table table-hover'>
        <thead>
          <tr>
            <th>Name</th>
            <th>Tags</th>
            <th>Control</th>
          </tr>
        </thead>
        <tbody>
          {this.surveys()}
        </tbody>
      </table>
      </React.Fragment>
      
    );
  }
}

export default SurveysList
