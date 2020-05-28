import React from "react"
import { Form, Button } from 'react-bootstrap';
import { fetchQuestions, postFetchQuestionsChoice, postFetchQuestionsOther } from './Fetch';
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'

class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: [],
      checkedItems: [],
      step: 0,
      answer: {},
    }
  };
  componentDidMount() {
    fetchQuestions(this.props.survey.id)
      .then(response => response.json())
      .then(result => this.setState({questions: result}));
  }

  radioType(q){
    let check = []
    for (let variant of q.variants) {
      check.push(
      <Form.Check 
        custom
        type={'radio'}
        id={`default-radio${variant.id}`}
        key={`default-radio${variant.id}`}
        name={`formVericalRadios${q.id}`}
        label={variant.title}
        value={variant.id}
        onChange={this.handleChangeRadio(q.id)}
        required
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
        custom
        type={'checkbox'}
        id={`default-checkbox${variant.id}`}
        key={`default-checkbox${variant.id}`}
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
      <Form.Control type="text" onChange={this.handleChangeInput(q.id)} required/>
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
      if (index > -1) 
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

  sendAnswerChoice(answer){
    const data = {
      choiceField: {
        question_id: answer.question_id,
        variant_id: answer.variant_id
      }
    }
    postFetchQuestionsChoice(data)
      .then( response => {
        if (response.statusText == 'Created') {
            console.log('success');
          }
        else {
          console.log(response.status + ' - ' + response.statusText);
          }
        })
  }
  sendAnswerOther(answer){
    const data = {
      otherField: {
        question_id: answer.question_id,
        title: answer.title
      }
    }
    postFetchQuestionsOther(data)
      .then( response => {
        if (response.statusText == 'Created') {
            console.log('success');
          }
        else {
          console.log(response.status + ' - ' + response.statusText);
          }
        })
  }

  fillAnswerChecked(question_id){
    const { checkedItems } = this.state;
    for (let item of checkedItems) {
      let answer = {
          question_id: question_id,
          variant_id: item
      };
      this.sendAnswerChoice(answer)
    }
    this.setState({
      checkedItems: [],
    });
  }  

  handleSubmit = (question) => event => {
    event.preventDefault();
    const { step, checkedItems } = this.state;
    if (question.kind == 'radio_buttons')
      this.sendAnswerChoice(this.state.answer)
    else if (question.kind == 'check_boxes')
      this.fillAnswerChecked(question.id)
    else
      this.sendAnswerOther(this.state.answer)
    this.setState({
      step: step + 1,
    });
  }

  questionSinglForm(q){
    return (
      <Form onSubmit={this.handleSubmit(q)}>
        <Form.Group controlId={`formGroups${q.id}`}>
          <Form.Label>{q.title}</Form.Label>
          {this.questionType(q)}
        </Form.Group>
        <Button variant="primary" type="submit"> Save
        </Button>
      </Form>
    );

  }

  switch(){
    const { step } = this.state;
    let questions = this.state.questions
    const length = questions.length
    //Check add
    if (length != 0 && length != step){
      return (
        this.questionSinglForm(questions[step])
      )
    }
    else if (length != 0) {
      // window.location.href = Routes.respondent_root_path();
    }
  }
  render () {
    return (
      <React.Fragment>
        <Container>
          <Row>
            <Col></Col>
            <Col xs={5}>
              <h1>{this.props.survey.title}</h1>
              {this.switch()}
            </Col>
            <Col></Col>
          </Row>
        </Container>
      </React.Fragment>
    );
  }
}
export default QuestionList
