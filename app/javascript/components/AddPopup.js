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

  componentDidUpdate (prevProps) {
    if (this.props.surveyId != null && this.props.surveyId !== prevProps.surveyId) {
      // this.loadQuestions(this.props.surveyId);
      console.log('loadQuestions')
    };
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
            <ListGroup.Item>Cras justo odio</ListGroup.Item>
            <ListGroup.Item>Dapibus ac facilisis in</ListGroup.Item>
            <ListGroup.Item>Morbi leo risus</ListGroup.Item>
            <ListGroup.Item>Porta ac consectetur ac</ListGroup.Item>
            <ListGroup.Item>Vestibulum at eros</ListGroup.Item>
          </ListGroup>
        </Modal.Body>

        <Modal.Footer>
          <Button onClick={this.props.onClose}>Close</Button>
          <Button>Save changes</Button>
        </Modal.Footer>
      </Modal>
    </div>
  }
}