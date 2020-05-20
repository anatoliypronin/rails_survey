import React from 'react';
import { Modal, Form,  Button, FormGroup, FormLabel , FormControl } from 'react-bootstrap';
import ListGroup from 'react-bootstrap/ListGroup'

export default class AddPopup extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      questions: [],
    }
  };
  fetchQuestions(surveyId) {
    return fetch(Routes.api_v1_survey_questions_path({survey_id: surveyId, format: 'json'}))
      .then(response => response.json())
      .then(result => this.setState({questions: result}))
  }

  componentDidUpdate (prevProps) {
    if (this.props.surveyId != null && this.props.surveyId !== prevProps.surveyId) {
      this.fetchQuestions(this.props.surveyId);
      console.log('loadQuestions')
    };
  }

  listQuestions(){
    let list = []
    const questions = this.state.questions;
    for (let q of questions) {
      list.push(
        <ListGroup.Item variant="primary">{q.title}</ListGroup.Item>
      );
    }
    return (
      list
    );
  }

  render () {
    return <div>
      <Modal animation={false} show={this.props.show} onHide={this.props.onClose}>
        <Modal.Header closeButton>
          <Modal.Title>
            List Questions
          </Modal.Title>
        </Modal.Header>

        <Modal.Body>
          <ListGroup>
            {this.listQuestions()}
          </ListGroup>
        </Modal.Body>

        <Modal.Footer>
          <Button onClick={this.props.onClose}>Close</Button>
          <Button>Go</Button>
        </Modal.Footer>
      </Modal>
    </div>
  }
}