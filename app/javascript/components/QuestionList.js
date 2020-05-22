import React from "react"
import { Form, Button } from 'react-bootstrap';


class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: [],
    }
  };
  componentDidMount() {
    this.fetchQuestions();
  }
  fetchQuestions() {
    return fetch(Routes.api_v1_survey_questions_path({survey_id: this.props.survey, format: 'json'}))
      .then(response => response.json())
      .then(result => this.setState({questions: result}))
  }
  radioType(q){
    let check = []
    for (let variant of q.variants) {
      check.push(
      <Form.Check 
        type={'radio'}
        id={`default-radio`}
        name={`formVericalRadios${q.id}`}
        label={variant.title}
      />
      );
    }
    return (
      check
    );
  }

  checkType(q){
    let check = []
    for (let variant of q.variants) {
      check.push(
      <Form.Check 
        type={'checkbox'}
        id={`default-radio`}
        label={variant.title}
      />
      );
    }
    return (
      check
    );
  }

  otherType(q){
    return (
      <Form.Control type="text" />
    );
  }

  questionType(q){
    if (q.kind == 'radio_buttons')
      return this.radioType(q)
    else if (q.kind == 'check_boxes')
      return this.checkType(q)
    else
      return this.otherType(q)  
  }

  questionForm(){
    let list = []
    let questions = this.state.questions
    for (let q of questions) {
      list.push(
        <Form.Group controlId="formGroup1">
          <Form.Label>{q.title}</Form.Label>
          {this.questionType(q)}
        </Form.Group>
      );
    }
    return (
      list
    );
  }
  render () {
    return (
      <React.Fragment>
        <h1>Question Form</h1>
        <Form>
          {this.questionForm()}
          <Button variant="primary" type="submit">
            Save
          </Button>
        </Form>
      </React.Fragment>
    );
  }
}
export default QuestionList
