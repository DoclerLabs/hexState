package hex.state.config.stateful;

import hex.config.stateful.IStatefulConfig;
import hex.di.IDependencyInjector;
import hex.event.IDispatcher;
import hex.module.IModule;
import hex.state.control.StateController;

/**
 * ...
 * @author Francis Bourre
 */
class StatefulStateMachineConfig implements IStatefulConfig
{
	private var _stateMachine 		: StateMachine;
	private var _stateController 	: StateController;
	private var _startState 		: State;

	public function new( startState : State ) 
	{
		this._startState = startState;
	}
	
	public function configure( injector : IDependencyInjector, dispatcher : IDispatcher<{}>, module : IModule ) : Void
	{
		this._stateMachine = new StateMachine( this._startState );
		this._stateController = new StateController( injector, this._stateMachine );

		injector.mapToValue( StateMachine, this._stateMachine );
		injector.mapToValue( StateController, this._stateController );

		dispatcher.addListener( this._stateController );
	}
}