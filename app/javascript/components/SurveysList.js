import React from "react"
import PropTypes from "prop-types"
import AddPopup from './AddPopup';
import Table from 'react-bootstrap/Table'
import Col from 'react-bootstrap/Col'

class SurveysList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      surveys: [],
      addPopupShow: false,
      survey: {
        questions: [],
        id: null,
      }
    }
  };
  fetchSurvey() {
    return fetch(Routes.api_v1_surveys_path({format: 'json'}))
      .then(response => response.json())
      .then(result => this.setState({surveys: result}))
  }
  handleAddClose = () => {
    this.setState({ addPopupShow: false });
  }

  handleAddShow = (survey) => {
    this.setState({ 
      addPopupShow: true,
      survey: survey
    });
  }
  
  componentDidMount() {
    this.fetchSurvey();
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
      result.join()
    );
  }

  surveys(){
    let table = [];
    const surveys = this.state.surveys;
    for (let survey of surveys) {
    table.push(
      <tr key={survey.id} onClick={() => this.handleAddShow(survey)}>
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
      <Col className='d-flex align-items-center p-3 my-3 rounded box-shadow'>
        <h2>Публичные опросы</h2>
      </Col>
      <Table striped hover variant="dark">
        <thead>
          <tr>
            <th>Name</th>
            <th>Tags</th>
          </tr>
        </thead>
        <tbody>
          {this.surveys()}
        </tbody>
      </Table>
      <AddPopup
        show = {this.state.addPopupShow}
        onClose={this.handleAddClose}
        questions ={this.state.survey.questions}
        surveyId = {this.state.survey.id}
      />
      </React.Fragment>
    );
  }
}

export default SurveysList
