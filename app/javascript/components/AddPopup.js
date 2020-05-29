import React from 'react';
import { Modal, Form,  Button, FormGroup, FormLabel , FormControl } from 'react-bootstrap';
import ListGroup from 'react-bootstrap/ListGroup'

export default class AddPopup extends React.Component {
  listQuestions(questions){
    let list = []
    for (let q of questions) {
      list.push(
        <ListGroup.Item variant="primary">{q.title}</ListGroup.Item>
      );
    }
    return (
      list
    );
  }
  linkOnSurvey(SurveyId){
    window.location.href = Routes.new_respondent_survey_answer_path(SurveyId)
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
            {this.listQuestions(this.props.questions)}
          </ListGroup>
        </Modal.Body>

        <Modal.Footer>
          <Button onClick={this.props.onClose}>Close</Button>
          <Button onClick={() => this.linkOnSurvey(this.props.surveyId)}>Go</Button>
        </Modal.Footer>
      </Modal>
    </div>
  }
}