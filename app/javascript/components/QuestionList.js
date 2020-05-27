import React from "react"
import { Form, Button } from 'react-bootstrap';


class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: [],
      checkedItems: [],
      step: 0,
      answer: {}
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
        key={`default-radio${variant.id}`}
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

  sendAnswer(answer){
    console.log(answer)
  }

  sendAnswerChecked(question_id){
    const { checkedItems } = this.state;
    for (let item of checkedItems) {
      let answer = {
          question_id: question_id,
          variant_id: item
      };
      this.sendAnswer(answer)
    }
    this.setState({
      checkedItems: [],
    });
  }  

  handleSubmit = (question_id) => event => {
    event.preventDefault();
    const { step, checkedItems } = this.state;
    if (checkedItems.length != 0) {
      this.sendAnswerChecked(question_id)
    }
    else{
      this.sendAnswer(this.state.answer)
    }
    this.setState({
      step: step + 1,
    });
  }

  questionSinglForm(q){
    return (
      <Form onSubmit={this.handleSubmit(q.id)}>
          <Form.Group controlId={`formGroup${q.id}`}>
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
        <h1>Question Form</h1>
        {this.switch()}
        
      </React.Fragment>
    );
  }
}
export default QuestionList
