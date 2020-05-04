import React, {Component} from 'react';
import { connect } from 'react-redux';

class NotesPage extends Component {
  componentDidMount() {
    this.props.dispatch({type: 'GET_NOTES'});
  }

  render() {
    return (
      <div>
        <p>Currently logged in as <b>{this.props.user.username}</b></p>
        <p>Clearance level: <b>{this.props.user.access_level}</b></p>
        {this.props.user.access_level === 0 ?
          <p>You do not have access to add notes.</p> :
          <div><label>Additional Notes: <input placeholder="Notes" /></label></div>
        }
        <ul>
          {this.props.notes.map((noteItem, noteIndex) => {
            return (
              <li key={noteIndex}>
                {noteItem.content}
                <div><em>with clearance: {noteItem.access_level}</em></div>
              </li>
            );
          })}
        </ul>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  notes: state.notes,
  user: state.user,
});

export default connect(mapStateToProps)(NotesPage);
