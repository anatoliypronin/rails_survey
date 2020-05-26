import React from "react"
import { Form, Button } from 'react-bootstrap';


class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: [],
      checkedItems: [],
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
        id={`default-radio${variant.id}`}
        name={`formVericalRadios${q.id}`}
        label={variant.title}
        value={variant.id}
        onChange={this.handleChangeRadio(q.id)}
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
        id={`default-checkbox${variant.id}`}
        label={variant.title}
        value={variant.id}
        onChange={this.handleChangeCheck(q.id)}
      />
      );
    }
    return (
      check
    );
  }

  otherType(q){
    return (
      <Form.Control type="text" onChange={this.handleChangeInput(q.id)} />
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

  handleChangeRadio = (question_id) => (e) => {
    const value = e.target.value;
    this.setState({
      answer: {
        question_id: question_id,
        variant_id: value
      }
    });
  };
  handleChangeCheck = (question_id) => (e) => {
    const value = e.target.value ;
    const checked = e.target.checked;
    let items = this.state.checkedItems;
    if (checked){
    items.push(value)
    }else{
    const index = items.indexOf(value);
    items.splice(index, 1);
    }
    this.setState({
      checkedItems: items,
    });
  };
  handleChangeInput = (question_id) => (e) => {
    const value = e.target.value;
    this.setState({
      answer: {
        question_id: question_id,
        title: value
      }
    });
  };

  handleSubmit = event => {
    event.preventDefault();
    console.log(this.state.answer);
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
        <Form onSubmit={this.handleSubmit}>
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
